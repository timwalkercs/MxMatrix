using Microsoft.AspNetCore.Mvc;
using MxMatrix.Server.Models; // or whatever your Models namespace is
using MxMatrix.Server.Data;
using Microsoft.EntityFrameworkCore;   // for your DbContextEF

namespace MxMatrix.Data.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MxSwitchController : ControllerBase
    {
        private readonly DbContextEF _context;

        public MxSwitchController(DbContextEF context)
        {
            _context = context;
        }

        // GET /api/mxswitch
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MxSwitch>>> GetSwitches()
        {
            var switches = await _context.Switches
                .Include(s => s.SwitchDescriptors)
                    .ThenInclude(sd => sd.Descriptor)
                .ToListAsync();

            var result = switches.Select(sw => new
            {
                sw.Id,
                sw.Name,
                sw.Type,
                sw.Brand,
                sw.Manufacturer,
                sw.TopHousingMaterial,
                sw.BottomHousingMaterial,
                sw.MountType,
                sw.StemConstruction,
                sw.SpringDescription,              
                sw.StemMaterial,
                sw.ActuationForce,
                sw.BottomOutForce,
                sw.FactoryLubed,
                sw.PreTravel,
                sw.TotalTravel,
                sw.Silent,
                sw.ImageUrl,
                Descriptors = sw.SwitchDescriptors.Select(sd => sd.Descriptor!.Name).ToList()
            });

            return Ok(result);
        }

        // GET /api/mxswitch/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<MxSwitch>> GetSwitch(int id)
        {
            var switchItem = await _context.Switches
                .Include(s => s.SwitchDescriptors)
                    .ThenInclude(sd => sd.Descriptor)
                .FirstOrDefaultAsync(s => s.Id == id);

            if (switchItem == null)
            {
                return NotFound();
            }

            var result = new
            {
                switchItem.Id,
                switchItem.Name,
                switchItem.Type,
                switchItem.Brand,
                switchItem.Manufacturer,
                switchItem.TopHousingMaterial,
                switchItem.BottomHousingMaterial,
                switchItem.MountType,
                switchItem.StemConstruction,
                switchItem.SpringDescription,
                switchItem.StemMaterial,
                switchItem.ActuationForce,
                switchItem.BottomOutForce,
                switchItem.FactoryLubed,
                switchItem.PreTravel,
                switchItem.TotalTravel,
                switchItem.Silent,
                switchItem.ImageUrl,
                Descriptors = switchItem.SwitchDescriptors.Select(sd => sd.Descriptor!.Name).ToList()
            };

            return Ok(result);
        }

        [HttpGet("descriptors")]
        public async Task<ActionResult<IEnumerable<Descriptor>>> GetDescriptors()
        {
            var descriptors = await _context.Descriptors.ToListAsync();
            return Ok(descriptors);
        }

        [HttpGet("bottomout-range")]
        public async Task<IActionResult> GetBottomOutForceRange()
        {
            var min = await _context.Switches.MinAsync(s => s.BottomOutForce);
            var max = await _context.Switches.MaxAsync(s => s.BottomOutForce);

            return Ok(new { min, max });
        }

        [HttpGet("totaltravel-range")]
        public async Task<IActionResult> GetTotalTravelRange()
        {
            var min = await _context.Switches.MinAsync(s => s.TotalTravel);
            var max = await _context.Switches.MaxAsync(s => s.TotalTravel);

            return Ok(new { min, max });
        }

    }
}
