DATASET_PATH="$1"

echo "Running feature_extractor...";
colmapAtInsight feature_extractor \
   --database_path $DATASET_PATH/database.db \
   --image_path $DATASET_PATH/images;

echo "Running exhaustive_matcher...";
colmapAtInsight exhaustive_matcher \
   --database_path $DATASET_PATH/database.db;

mkdir $DATASET_PATH/sparse;

echo "Running mapper...";
colmapAtInsight mapper \
    --database_path $DATASET_PATH/database.db \
    --image_path $DATASET_PATH/images \
    --output_path $DATASET_PATH/sparse;

mkdir $DATASET_PATH/dense;

echo "Running image_undistorter...";
colmapAtInsight image_undistorter \
    --image_path $DATASET_PATH/images \
    --input_path $DATASET_PATH/sparse/0 \
    --output_path $DATASET_PATH/dense \
    --output_type COLMAP \
    --max_image_size 2000;

echo "Running patch_match_stereo...";
colmapAtInsight patch_match_stereo \
    --workspace_path $DATASET_PATH/dense \
    --workspace_format COLMAP \
    --PatchMatchStereo.geom_consistency true;

echo "Running stereo_fusion...";
colmapAtInsight stereo_fusion \
    --workspace_path $DATASET_PATH/dense \
    --workspace_format COLMAP \
    --input_type geometric \
    --output_path $DATASET_PATH/dense/fused.ply;
