using Microsoft.Extensions.Logging;

using Domain.Events;
using Application.Shared.Clients;
using Application.Shared.Messaging;

namespace Application.Organizations.Events.OrganizationUpdatedEventHandler;

public class OrganizationUpdatedEventHandler : IDomainEventHandler<OrganizationUpdatedEvent>
{
    private readonly IFileServiceClient _fileServiceClient;
    private readonly ILogger<OrganizationUpdatedEventHandler> _logger;

    public OrganizationUpdatedEventHandler(
        IFileServiceClient fileServiceClient,
        ILogger<OrganizationUpdatedEventHandler> logger)
    {
        _fileServiceClient = fileServiceClient;
        _logger = logger;
    }

    public async Task HandleAsync(OrganizationUpdatedEvent @event, CancellationToken cancellationToken = default)
    {
        _logger.LogDebug("Handling organization {organizationId} updated event", @event.OrganizationId);

        if (@event.OldLogoPath != null && @event.OldLogoPath != @event.NewLogoPath)
        {
            _logger.LogDebug("Deleting organization {organizationId} old logo image {logoPath}",
                @event.OrganizationId, @event.OldLogoPath);
            await _fileServiceClient.DeleteAsync(@event.OldLogoPath, cancellationToken).ConfigureAwait(false);
        }
    }
}