using MxMatrix.Server.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

[Table("switch_descriptors", Schema = "SwitchSchema")]
public class SwitchDescriptor
{
    [ForeignKey("Switch")]
    [Column("switch_id")]
    public int SwitchId { get; set; }

    public MxSwitch? Switch { get; set; }

    [ForeignKey("Descriptor")]
    [Column("descriptor_id")]
    public int DescriptorId { get; set; }

    public Descriptor? Descriptor { get; set; }
}
