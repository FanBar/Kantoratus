using Microsoft.EntityFrameworkCore.Migrations;

namespace Kantoratus.Persistence.Migrations
{
    public partial class SheetMusic_IsHighlightedInIndex : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "IsHighlightedInIndex",
                schema: "KFOLD_website",
                table: "SheetMusics",
                type: "bit",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsHighlightedInIndex",
                schema: "KFOLD_website",
                table: "SheetMusics");
        }
    }
}
