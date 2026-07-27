# Power Query / ETL Design

The model imports eight UTF-8 CSV files through a reusable `DataRoot` parameter. The included configuration scripts resolve the repository's local `Data` folder automatically, so no manual path editing is required.

Recommended transformations demonstrated in the model design:
- Promote headers and assign explicit data types
- Remove invalid keys and duplicate dimension records
- Standardize text casing and trim whitespace
- Validate positive quantity and financial amounts
- Build a conformed calendar dimension
- Separate transaction facts from descriptive dimensions
- Preserve raw source files for reproducibility
