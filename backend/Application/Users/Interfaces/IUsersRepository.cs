using Domain.Models;

namespace Application.Users.Interfaces;

public interface IUsersRepository
{
    Task Add(User user, CancellationToken cancellationToken = default);
    Task<User?> GetById(Guid id, CancellationToken cancellationToken = default);
    Task<User?> GetByEmail(string email, CancellationToken cancellationToken = default);
    Task<User?> GetByEmailWithRefreshTokens(string email, CancellationToken cancellationToken = default);
    Task<List<User>> GetNonActiveList(CancellationToken cancellationToken = default);
    void Update(User user);
    void DeleteRange(IEnumerable<User> users);
}