using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MxMatrix.Server.Migrations
{
    /// <inheritdoc />
    public partial class AddDescriptorManyToMany : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "SwitchSchema");

            migrationBuilder.CreateTable(
                name: "descriptors",
                schema: "SwitchSchema",
                columns: table => new
                {
                    descriptor_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_descriptors", x => x.descriptor_id);
                });

            migrationBuilder.CreateTable(
                name: "switches",
                schema: "SwitchSchema",
                columns: table => new
                {
                    switch_id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    name = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    type = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    brand = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    manufacturer = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    top_housing_material = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    bottom_housing_material = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    mount_type = table.Column<string>(type: "nvarchar(1)", nullable: false),
                    stem_construction = table.Column<string>(type: "nvarchar(10)", maxLength: 10, nullable: false),
                    spring_description = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true),
                    stem_material = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: true),
                    actuation_force = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    bottom_out_force = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    factory_lubed = table.Column<bool>(type: "bit", nullable: false),
                    pre_travel = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    total_travel = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    silent = table.Column<bool>(type: "bit", nullable: false),
                    image_url = table.Column<string>(type: "nvarchar(255)", maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_switches", x => x.switch_id);
                });

            migrationBuilder.CreateTable(
                name: "switch_descriptors",
                schema: "SwitchSchema",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    switch_id = table.Column<int>(type: "int", nullable: false),
                    descriptor_id = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_switch_descriptors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_switch_descriptors_descriptors_descriptor_id",
                        column: x => x.descriptor_id,
                        principalSchema: "SwitchSchema",
                        principalTable: "descriptors",
                        principalColumn: "descriptor_id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_switch_descriptors_switches_switch_id",
                        column: x => x.switch_id,
                        principalSchema: "SwitchSchema",
                        principalTable: "switches",
                        principalColumn: "switch_id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_switch_descriptors_descriptor_id",
                schema: "SwitchSchema",
                table: "switch_descriptors",
                column: "descriptor_id");

            migrationBuilder.CreateIndex(
                name: "IX_switch_descriptors_switch_id",
                schema: "SwitchSchema",
                table: "switch_descriptors",
                column: "switch_id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "switch_descriptors",
                schema: "SwitchSchema");

            migrationBuilder.DropTable(
                name: "descriptors",
                schema: "SwitchSchema");

            migrationBuilder.DropTable(
                name: "switches",
                schema: "SwitchSchema");
        }
    }
}
