using Asp.Versioning;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

using Application.Users.Models;
using Application.Users.Queries.GetUserInfo;
using Application.Users.Commands.UpdatePassword;

using WebAPI.Models;

namespace WebAPI.Controllers;

[Route("{version:apiVersion}/users"), ApiVersionNeutral]
public class UsersController : BaseController
{
    /// <summary>
    /// Gets user info
    /// </summary>
    /// <returns>Returns new user ID</returns>
    /// <response code="200">Success</response>
    /// <response code="401">If user is unauthorized (doesn't have jwt token)</response>
    [HttpGet("info"), Authorize]
    [ProducesResponseType(StatusCodes.Status200OK)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public async Task<ActionResult<UserInfo>> GetUserInfo(CancellationToken cancellationToken)
    {
        var query = new GetUserInfoQuery(UserId);
        var result = await Mediator.Send(query, cancellationToken);

        if (result.IsSuccess)
        {
            return Ok(result.Value);
        }

        return BadRequest(new { Detail = result.Error.Description });
    }

    /// <summary>
    /// Changes user password
    /// </summary>
    /// <param name="updateUserPasswordDto">Current and new passwords</param>
    /// <param name="cancellationToken">Cancellation token</param>
    /// <response code="204">Success</response>
    /// <response code="401">If user is unauthorized</response>
    [HttpPut("password")]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public async Task<IActionResult> UpdateUserPassword(
        UpdateUserPasswordDto updateUserPasswordDto, CancellationToken cancellationToken)
    {
        var updatePasswordCommand = new UpdatePasswordCommand(
            UserId: UserId,
            CurrentPassword: updateUserPasswordDto.CurrentPassword,
            NewPassword: updateUserPasswordDto.NewPassword);

        var result = await Mediator.Send(updatePasswordCommand, cancellationToken);

        if (result.IsSuccess)
        {
            return NoContent();
        }

        return BadRequest(new { Detail = result.Error.Description });
    }
}