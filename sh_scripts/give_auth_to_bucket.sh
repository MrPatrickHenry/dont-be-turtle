#!/usr/bin/env bash

export YOUR_TPU_NAME=jwkangmacpro2-tpu
export YOUR_SERVICE_NAME=service-283083143712@cloud-tpu.iam.gserviceaccount.com

export DATA_BUCKET=gs://pose_dataset_tfrecord
export MODEL_BUCKET=gs://dontbeturtle_ckpt/
export TENSORBOARD_BUCKET=gs://dontbeturtle_tflogs/

echo GET AUTHORIZATION OF GCP BUCKET

# check tpus list
gcloud alpha compute tpus describe ${YOUR_TPU_NAME}

# GIVE READ / WRITE AUTH

gsutil acl ch -u ${YOUR_SERVICE_NAME}:READER ${DATA_BUCKET}
gsutil acl ch -u ${YOUR_SERVICE_NAME}:WRITER ${DATA_BUCKET}


gsutil acl ch -u ${YOUR_SERVICE_NAME}:READER ${MODEL_BUCKET}
gsutil acl ch -u ${YOUR_SERVICE_NAME}:WRITER ${MODEL_BUCKET}

gsutil acl ch -u ${YOUR_SERVICE_NAME}:READER ${TENSORBOARD_BUCKET}
gsutil acl ch -u ${YOUR_SERVICE_NAME}:WRITER ${TENSORBOARD_BUCKET}

