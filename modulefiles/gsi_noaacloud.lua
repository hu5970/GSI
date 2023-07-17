help([[
]])

prepend_path("MODULEPATH", "/contrib/EPIC/miniconda3/modulefiles")
miniconda3_ver=os.getenv("miniconda3_ver") or "4.12.0"
load(pathJoin("miniconda3", miniconda3_ver))

prepend_path("MODULEPATH", "/contrib/EPIC/spack-stack/spack-stack-1.4.1/envs/unified-dev/install/modulefiles/Core")
load("stack-intel")
load("stack-intel-oneapi-mpi")
load("ufs-srw-app-env")
load("gsi-ncdiag/1.1.1")

load("gsi_common_spack")

pushenv("GSI_BINARY_SOURCE_DIR", "/contrib/EPIC/GSI_data/fix/20230601")
whatis("Description: GSI environment on Cloud with Intel Compilers")
