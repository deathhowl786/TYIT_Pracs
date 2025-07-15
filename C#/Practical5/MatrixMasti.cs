using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practical5
{
    public class MatrixMasti
    {
        public static void Main(string[] args)
        {
            int[,] A = ReadMatrix("A");
            PrintMatrix("A", A);
            int[,] B = ReadMatrix("B");
            PrintMatrix("B", B);
            PrintMatrix("AxB", MultiplyMatrices(A, B));
            Console.WriteLine($"Largest Element of A: {LargestNumber(A)}");
            Console.WriteLine($"Sum of Corners of A: {SumOfCorners(A)}");
            Console.WriteLine($"Diff of Diagonals of A: {DiffOfDiag(A)}");
        }

        public static int[,] ReadMatrix(string name)
        {
            Console.Write($"Rows for Matrix {name}: ");
            int rows = int.Parse(Console.ReadLine());

            Console.Write($"Columns for Matrix {name}: ");
            int cols = int.Parse(Console.ReadLine());

            int[,] matrix = new int[rows, cols];
            Console.WriteLine($"Enter elements for Matrix {name}:");

            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    Console.Write($"{name}[{i+1},{j+1}]: ");
                    matrix[i, j] = int.Parse(Console.ReadLine());
                }
            }

            Console.WriteLine();

            return matrix;
        }

        public static int[,] MultiplyMatrices(int[,] A, int[,] B)
        {
            int rowsA = A.GetLength(0);
            int rowsB = B.GetLength(0);
            int colsA = A.GetLength(1);
            int colsB = B.GetLength(1);

            if (colsA != rowsB)
            {
                Console.WriteLine("Matrix multiplication not possible. Columns of A must match rows of B.");
                return new int[0,0];
            }

            int[,] result = new int[rowsA, colsB];

            for (int i = 0; i < rowsA; i++)
            {
                for (int j = 0; j < colsB; j++)
                {
                    result[i, j] = 0;
                    for (int k = 0; k < colsA; k++)
                    {
                        result[i, j] += A[i, k] * B[k, j];
                    }
                }
            }

            return result;
        }

        public static void PrintMatrix(string label, int[,] matrix)
        {
            Console.WriteLine($"{label}\n========================");

            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);

            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    Console.Write(matrix[i, j] + "\t");
                }
                Console.WriteLine();
            }

            Console.WriteLine();
        }

        public static int LargestNumber(int[,] matrix)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);
            int largest = matrix[0, 0];
            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    if (matrix[i, j] > largest) largest = matrix[i, j];
                }
            }
            return largest;
        }

        public static int SumOfCorners(int[,] m)
        {
            int r = m.GetLength(0);
            int c = m.GetLength(1);
            return m[0, 0] + m[0, c-1] + m[r-1, 0] + m[r-1, c-1];
        }

        public static int DiffOfDiag(int[,] m)
        {   
           
            int r = m.GetLength(0);
            int c = m.GetLength(1);
            int sum = 0;
            if (r != c)
            {
                Console.WriteLine("Not a Sqaure Matrix, Can't find Diff. Of Diagonals.");
                return sum;
            }
            int j = c - 1;

            for (int i = 0; i < r; i++)
            {
                if (i <= c) sum += m[i, i];
                if (j > -1) sum -= m[i, j];
                j--;
            }
            return sum;
        }

    }
}

