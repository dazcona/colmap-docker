echo "Running reconstruction...";
colmap automatic_reconstructor \ 
    --workspace_path $DATASET_PATH \
    --image_path $DATASET_PATH/images