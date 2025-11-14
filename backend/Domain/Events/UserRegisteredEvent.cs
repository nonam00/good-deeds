using Domain.Common;

namespace Domain.Events;

public class UserRegisteredEvent : DomainEvent
{
    public Guid UserId { get; private init; }
    public string Email { get; private init; }

    public UserRegisteredEvent(Guid userId, string email)
    {
        UserId = userId;
        Email = email;
    }
}