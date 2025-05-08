using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MxMatrix.Server.Models
{
    [Table("switches", Schema = "SwitchSchema")]
    public class MxSwitch
    {
        [Key]
        [Column("switch_id")]
        public int Id { get; set; }

        [Required]
        [Column("name")]
        [StringLength(100)]
        public string? Name { get; set; }

        [Required]
        [Column("type")]
        [StringLength(10)]
        public string? Type { get; set; } // "Linear", "Tactile", or "Clicky"

        [Required]
        [Column("brand")]
        [StringLength(100)]
        public string? Brand { get; set; }

        [Column("manufacturer")]
        [StringLength(100)]
        public string? Manufacturer { get; set; }

        [Column("top_housing_material")]
        [StringLength(100)]
        public string? TopHousingMaterial { get; set; }

        [Column("bottom_housing_material")]
        [StringLength(100)]
        public string? BottomHousingMaterial { get; set; }

        [Required]
        [Column("mount_type")]
        public char MountType { get; set; } // '3' or '5'

        [Required]
        [Column("stem_construction")]
        [StringLength(10)]
        public string? StemConstruction { get; set; } // "Standard" or "Box"

        [Column("spring_description")]
        [StringLength(255)]
        public string? SpringDescription { get; set; }

        [Column("stem_material")]
        [StringLength(100)]
        public string? StemMaterial { get; set; }

        [Column("actuation_force")]
        public decimal? ActuationForce { get; set; } // DECIMAL(5,2) - nullable

        [Column("bottom_out_force")]
        public decimal? BottomOutForce { get; set; } // DECIMAL(5,2) - nullable

        [Column("factory_lubed")]
        public bool FactoryLubed { get; set; } = false; // Default 0 (false)

        [Column("pre_travel")]
        public decimal? PreTravel { get; set; } // DECIMAL(3,2) - nullable

        [Column("total_travel")]
        public decimal? TotalTravel { get; set; } // DECIMAL(3,2) - nullable

        [Column("silent")]
        public bool Silent { get; set; } = false; // Default 0 (false)

        [Column("image_url")]
        [StringLength(255)]
        public string? ImageUrl { get; set; }

        //EF uses navigation properties on both sides of many-to-many relationships for effiecient querying and proper relation tracking
        public ICollection<SwitchDescriptor> SwitchDescriptors { get; set; } = new List<SwitchDescriptor>();

    }
}