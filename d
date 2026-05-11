public class BoardDisplay {
    private String[][] grid;
    private boolean[][] southWalls;
    private boolean[][] eastWalls;
    private int rows;
    private int cols;

    public BoardDisplay(int rows, int cols) {
        this.rows = rows;
        this.cols = cols;
        grid = new String[rows][cols];
        southWalls = new boolean[rows][cols];
        eastWalls = new boolean[rows][cols];
        northWalls = new boolean[rows][cols];
        westWalls = new boolean[rows][cols];
    }

    public void set(int x, int y, String content) {
        if (isInside(x, y)) {
            if (content.length() > 2) {
                content = content.substring(0, 2);
            }
            grid[y][x] = String.format("%-2s", content);
        }
    }

    public void setSouthWall(int x, int y) {
        if (isInside(x, y)) {
            southWalls[y][x] = true;
        }
    }

    public void setEastWall(int x, int y) {
        if (isInside(x, y)) {
            eastWalls[y][x] = true;
        }
    }

    private boolean isInside(int x, int y) {
        return x >= 0 && x < cols && y >= 0 && y < rows;
    }

    public void show() {
        // top outer wall
        for (int x = 0; x < cols; x++) {
            System.out.print("+--");
        }
        System.out.println("+");

        for (int y = 0; y < rows; y++) {
            // content row
            System.out.print("|"); // left outer wall
            for (int x = 0; x < cols; x++) {
                String content = grid[y][x] == null ? "  " : grid[y][x];
                System.out.print(content);

                boolean hasEastWall = eastWalls[y][x] || x == cols - 1;
            }
            System.out.println();

            // horizontal wall row
            for (int x = 0; x < cols; x++) {
                System.out.print("+");
                boolean hasSouthWall = southWalls[y][x] || y == rows - 1;
                boolean hasNorthWallOfNextRow = y + 1 < rows && northWalls[y + 1][x];
                System.out.print((hasSouthWall || hasNorthWallOfNextRow) ? "--" : "  ");
            }
            System.out.println("+");
        }
    }
}
