using Microsoft.EntityFrameworkCore.Migrations;

namespace Kantoratus.Persistence.Migrations
{
    public partial class SheetMusic : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "KFOLD_website");

            migrationBuilder.CreateTable(
                name: "Chapters",
                schema: "KFOLD_website",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Chapters", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SubChapters",
                schema: "KFOLD_website",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ChapterId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(450)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubChapters", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SubChapters_Chapters_ChapterId",
                        column: x => x.ChapterId,
                        principalSchema: "KFOLD_website",
                        principalTable: "Chapters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SheetMusics",
                schema: "KFOLD_website",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Number = table.Column<string>(type: "nvarchar(3)", maxLength: 3, nullable: false),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    SubChapterId = table.Column<int>(type: "int", nullable: false),
                    Lyrics = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Origin = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HimnologicalData1 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    HimnologicalData2 = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    OriginalTitle = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SheetMusics", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SheetMusics_SubChapters_SubChapterId",
                        column: x => x.SubChapterId,
                        principalSchema: "KFOLD_website",
                        principalTable: "SubChapters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "UX_Chapter_Name",
                schema: "KFOLD_website",
                table: "Chapters",
                column: "Name",
                unique: true,
                filter: "[Name] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_SheetMusics_SubChapterId",
                schema: "KFOLD_website",
                table: "SheetMusics",
                column: "SubChapterId");

            migrationBuilder.CreateIndex(
                name: "UX_SheetMusic_Number",
                schema: "KFOLD_website",
                table: "SheetMusics",
                column: "Number",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UX_SubChapter_ChapterId_Name",
                schema: "KFOLD_website",
                table: "SubChapters",
                columns: new[] { "ChapterId", "Name" },
                unique: true,
                filter: "[Name] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "SheetMusics",
                schema: "KFOLD_website");

            migrationBuilder.DropTable(
                name: "SubChapters",
                schema: "KFOLD_website");

            migrationBuilder.DropTable(
                name: "Chapters",
                schema: "KFOLD_website");

            migrationBuilder.RenameTable(
                name: "PlayLists",
                schema: "KFOLD_website",
                newName: "PlayLists");

            migrationBuilder.RenameTable(
                name: "Pieces",
                schema: "KFOLD_website",
                newName: "Pieces");

            migrationBuilder.RenameTable(
                name: "Members",
                schema: "KFOLD_website",
                newName: "Members");

            migrationBuilder.RenameTable(
                name: "Facts",
                schema: "KFOLD_website",
                newName: "Facts");

            migrationBuilder.RenameTable(
                name: "Events",
                schema: "KFOLD_website",
                newName: "Events");

            migrationBuilder.RenameTable(
                name: "Composers",
                schema: "KFOLD_website",
                newName: "Composers");
        }
    }
}
