using Application.Shared.Clients;
using Application.Shared.Messaging;
using Domain.Events;
using Microsoft.Extensions.Logging;

namespace Application.Organizations.Events.OrganizationDeletedEventHandler;

public class OrganizationDeletedEventHandler : IDomainEventHandler<OrganizationDeletedEvent>
{
    private readonly IFileServiceClient _fileServiceClient;
    private readonly ILogger<OrganizationDeletedEventHandler> _logger;

    public OrganizationDeletedEventHandler(
        IFileServiceClient fileServiceClient,
        ILogger<OrganizationDeletedEventHandler> logger)
    {
        _fileServiceClient = fileServiceClient;
        _logger = logger;
    }

    public async Task HandleAsync(OrganizationDeletedEvent @event, CancellationToken cancellationToken = default)
    {
        _logger.LogDebug("Handling organization {organizationId} deleted event", @event.OrganizationId);

        if (@event.LogoPath != null)
        {
            _logger.LogDebug("Deleting organization {organizationId} logo image {logoPath}",
                @event.OrganizationId, @event.LogoPath);
            await _fileServiceClient.DeleteAsync(@event.LogoPath, cancellationToken).ConfigureAwait(false);
        }
    }
}   