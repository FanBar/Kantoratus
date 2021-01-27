using Microsoft.EntityFrameworkCore.Migrations;

namespace Kantoratus.Persistence.Migrations
{
    public partial class Composers : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Composers",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Composers", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "UX_Composer_Name",
                table: "Composers",
                column: "Name",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Composers");
        }
    }
}
