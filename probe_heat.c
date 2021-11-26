/*
  StencilProbe Heat Equation
  Implements 7pt stencil from Chombo's heattut example.
*/
#include <stdio.h>
#include "common.h"
#include "SZ_fault_generator.h"
const double EPSILON = 1.0E-20;
#define min(x, y) (x) < (y) ? (x) : (y)

#ifdef STENCILTEST
void StencilProbe_naive(double *A00, double *Anext0, int nx, int ny, int nz,
                        int tx, int ty, int tz, int timesteps)
{
#else
void StencilProbe(double *A00, double *Anext0, int nx, int ny, int nz,
                  int tx, int ty, int tz, int timesteps)
{
#endif
  // Fool compiler so it doesn't insert a constant here
  // double fac = A0[0];
  double minxyz = min(min((nx * nx) / ((nx - 1) * (nx - 1)), (ny * ny) / ((ny - 1) * (ny - 1))), (nz * nz) / ((nz - 1) * (nz - 1)));
  double fac = 1 / 16.0 * minxyz;
  double *temp_ptr;
  int i, j, k, t;

  Fault_Injector_Configs fi_config = read_fault_injector_config();
  overwrite_sz_config(fi_config);
  printf("####### EM: %s, EB: %s #######\n", fi_config.error_type, fi_config.error_bound_ch);

  timesteps = fi_config.iters;
  int timeNow = 0, step1 = fi_config.step1, step2 = fi_config.step2;
  
  double *Anext;
  double *A0;
  Anext = (double *)malloc(sizeof(double) * nx * ny * nz);
  A0 = (double *)malloc(sizeof(double) * nx * ny * nz);
  // for (timeNow = 0; timeNow <= timesteps; timeNow += step) {
  for (timeNow = step1; timeNow <= timesteps; timeNow += step2)
  {
    if (timeNow != step1 && timeNow != timesteps){
      step2 = timesteps - timeNow;
    }
    
    for (i = 0; i < nz * nx * ny; i++)
    {
      A0[i] = A00[i];
    }
    for (i = 0; i < nz * nx * ny; i++)
    {
      Anext[i] = Anext0[i];
    }
    printf("******* Injected Iters: %d *******\n", timeNow);
    for (t = 0; t <= timesteps; t++)
    {
      if (timeNow == t)
      {
        double *temp_A0 = (double *)malloc(nz * nx * ny * sizeof(double));
        temp_A0 = SZ_fault_generator_1D(nz * nx * ny, A0); // SZ fault generated!
        for (i = 0; i < nz * nx * ny; i++)
        {
          A0[i] = temp_A0[i];
          Anext[i] = temp_A0[i];
        }
        free(temp_A0);
      }
      for (k = 1; k < nz - 1; k++)
      {
        for (j = 1; j < ny - 1; j++)
        {
          for (i = 1; i < nx - 1; i++)
          {
            // printf("now space is z=%d, y=%d, x=%d:\n",k,j,i);

            // Anext[Index3D (nx, ny, i, j, k)] = (1 - 6 * fac) * A0[Index3D (nx, ny, i, j, k)]
            //                                    + fac / ((nx * nx) / ((nx - 1) * (nx - 1))) * (A0[Index3D (nx, ny, i + 1, j, k)] + A0[Index3D (nx, ny, i - 1, j, k)] - 2 * A0[Index3D (nx, ny, i, j, k)])
            //                                    + fac / ((ny * ny) / ((ny - 1) * (ny - 1))) * (A0[Index3D (nx, ny, i, j + 1, k)] + A0[Index3D (nx, ny, i, j - 1, k)] - 2 * A0[Index3D (nx, ny, i, j, k)])
            //                                    + fac / ((nz * nz) / ((nz - 1) * (nz - 1))) * (A0[Index3D (nx, ny, i, j, k + 1)] + A0[Index3D (nx, ny, i, j, k - 1)] - 2 * A0[Index3D (nx, ny, i, j, k)]);

            // Anext[Index3D (nx, ny, i, j, k)] = A0[Index3D (nx, ny, i, j, k)]
            //                                    -1/6.0*(A0[Index3D (nx, ny, i + 1, j, k)]+A0[Index3D (nx, ny, i - 1, j, k)]
            //                                            +A0[Index3D (nx, ny, i, j+ 1, k)]+A0[Index3D (nx, ny, i, j- 1, k)]
            //                                            +A0[Index3D (nx, ny, i, j, k+ 1)]+A0[Index3D (nx, ny, i, j, k- 1)]);

            Anext[Index3D(nx, ny, i, j, k)] = 1 / 7.0 * (A0[Index3D(nx, ny, i, j, k)] + A0[Index3D(nx, ny, i + 1, j, k)] + A0[Index3D(nx, ny, i - 1, j, k)] + A0[Index3D(nx, ny, i, j + 1, k)] + A0[Index3D(nx, ny, i, j - 1, k)] + A0[Index3D(nx, ny, i, j, k + 1)] + A0[Index3D(nx, ny, i, j, k - 1)]);
            //G stencil;
            //            Anext[Index3D (nx, ny, i, j, k)] = 1/sqrt(EPSILON +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j+1, k)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j+1, k)]) +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j-1, k)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j-1, k)]) +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j, k+1)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j, k+1)]) +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j, k-1)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i, j, k-1)]) +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i+1, j, k)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i+1, j, k)]) +
            //(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i-1, j, k)])*(A0[Index3D (nx, ny, i, j, k)] - A0[Index3D (nx, ny, i-1, j, k)]));
            // printf("Anext[Index3D (nx, ny, i, j, k)] = %.26lf\n",Anext[Index3D (nx, ny, i, j, k)] );
          }
        }
      }
      temp_ptr = A0;
      A0 = Anext;
      Anext = temp_ptr;
      if (t % 10 == 0)
      {
        printf("timestep = %d,", t);
        for (k = 1 - 1; k < nz; k++)
          for (j = 1 - 1; j < ny; j++)
            for (i = 1 - 1; i < nx; i++)
              printf("%.25lf,", A0[Index3D(nx, ny, i, j, k)]);
        printf("\n");
      }
    }
    // printf("timestep = %d,", t);
    // for (k = 1 - 1; k < nz ; k++)
    //   for (j = 1 - 1; j < ny ; j++)
    //     for (i = 1 - 1; i < nx ; i++)
    //       printf("%.25lf,", A0[Index3D (nx, ny, i, j, k)]);
    // printf("\n");
  }
  free(Anext);
  free(A0);
}
