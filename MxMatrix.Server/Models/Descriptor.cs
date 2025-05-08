using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

[Table("descriptors", Schema = "SwitchSchema")]
public class Descriptor
{
    [Key]
    [Column("descriptor_id")]
    public int Id { get; set; }

    [Required]
    [Column("name")]
    [StringLength(50)]
    public string Name { get; set; } = string.Empty;

    //EF uses navigation properties on both sides of many-to-many relationships for effiecient querying and proper relation tracking
    public ICollection<SwitchDescriptor> SwitchDescriptors { get; set; } = new List<SwitchDescriptor>();

}
