DATASET_PATH="$1"

echo "Running automatic_reconstructor...";
colmapAtInsight automatic_reconstructor \
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images \
    --dense 1 \
    --use_gpu 1

echo "Running stereo_fusion...";
colmap stereo_fusion \
    --workspace_path $DATASET_PATH/dense/0 \
    --workspace_format COLMAP \
    --input_type geometric \
    --output_path $DATASET_PATH/dense/0/fused.ply