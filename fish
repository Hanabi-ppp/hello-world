{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "name": "YOLOv5 Tutorial",
      "provenance": []
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "accelerator": "GPU"
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "t6MPjfT5NrKQ"
      },
      "source": [
        "<div align=\"center\">\n",
        "\n",
        "  <a href=\"https://ultralytics.com/yolov5\" target=\"_blank\">\n",
        "    <img width=\"1024\", src=\"https://raw.githubusercontent.com/ultralytics/assets/main/yolov5/v70/splash.png\"></a>\n",
        "\n",
        "\n",
        "<br>\n",
        "  <a href=\"https://bit.ly/yolov5-paperspace-notebook\"><img src=\"https://assets.paperspace.io/img/gradient-badge.svg\" alt=\"Run on Gradient\"></a>\n",
        "  <a href=\"https://colab.research.google.com/github/ultralytics/yolov5/blob/master/tutorial.ipynb\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"></a>\n",
        "  <a href=\"https://www.kaggle.com/ultralytics/yolov5\"><img src=\"https://kaggle.com/static/images/open-in-kaggle.svg\" alt=\"Open In Kaggle\"></a>\n",
        "<br>\n",
        "\n",
        "This <a href=\"https://github.com/ultralytics/yolov5\">YOLOv5</a> 🚀 notebook by <a href=\"https://ultralytics.com\">Ultralytics</a> presents simple train, validate and predict examples to help start your AI adventure.<br>We hope that the resources in this notebook will help you get the most out of YOLOv5. Please browse the YOLOv5 <a href=\"https://docs.ultralytics.com/yolov5\">Docs</a> for details, raise an issue on <a href=\"https://github.com/ultralytics/yolov5\">GitHub</a> for support, and join our <a href=\"https://ultralytics.com/discord\">Discord</a> community for questions and discussions!\n",
        "\n",
        "</div>"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "7mGmQbAO5pQb"
      },
      "source": [
        "# Setup\n",
        "\n",
        "Clone GitHub [repository](https://github.com/ultralytics/yolov5), install [dependencies](https://github.com/ultralytics/yolov5/blob/master/requirements.txt) and check PyTorch and GPU."
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "wbvMlHd_QwMG",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "e8225db4-e61d-4640-8b1f-8bfce3331cea"
      },
      "source": [
        "!git clone https://github.com/ultralytics/yolov5  # clone\n",
        "%cd yolov5\n",
        "%pip install -qr requirements.txt comet_ml  # install\n",
        "\n",
        "import torch\n",
        "import utils\n",
        "display = utils.notebook_init()  # checks"
      ],
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "YOLOv5 🚀 v7.0-136-g71244ae Python-3.9.16 torch-2.0.0+cu118 CUDA:0 (Tesla T4, 15102MiB)\n"
          ]
        },
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "Setup complete ✅ (2 CPUs, 12.7 GB RAM, 23.3/166.8 GB disk)\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "source": [],
      "metadata": {
        "id": "oLg6hhetR797"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "4JnkELT0cIJg"
      },
      "source": [
        "# 1. Detect\n",
        "\n",
        "`detect.py` runs YOLOv5 inference on a variety of sources, downloading models automatically from the [latest YOLOv5 release](https://github.com/ultralytics/yolov5/releases), and saving results to `runs/detect`. Example inference sources are:\n",
        "\n",
        "```shell\n",
        "python detect.py --source 0  # webcam\n",
        "                          img.jpg  # image\n",
        "                          vid.mp4  # video\n",
        "                          screen  # screenshot\n",
        "                          path/  # directory\n",
        "                         'path/*.jpg'  # glob\n",
        "                         'https://youtu.be/LNwODJXcvt4'  # YouTube\n",
        "                         'rtsp://example.com/media.mp4'  # RTSP, RTMP, HTTP stream\n",
        "```"
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "zR9ZbuQCH7FX",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "284ef04b-1596-412f-88f6-948828dd2b49"
      },
      "source": [
        "!python detect.py --weights yolov5s.pt --img 640 --conf 0.25 --source data/images\n",
        "# display.Image(filename='runs/detect/exp/zidane.jpg', width=600)"
      ],
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "\u001b[34m\u001b[1mdetect: \u001b[0mweights=['yolov5s.pt'], source=data/images, data=data/coco128.yaml, imgsz=[640, 640], conf_thres=0.25, iou_thres=0.45, max_det=1000, device=, view_img=False, save_txt=False, save_conf=False, save_crop=False, nosave=False, classes=None, agnostic_nms=False, augment=False, visualize=False, update=False, project=runs/detect, name=exp, exist_ok=False, line_thickness=3, hide_labels=False, hide_conf=False, half=False, dnn=False, vid_stride=1\n",
            "YOLOv5 🚀 v7.0-136-g71244ae Python-3.9.16 torch-2.0.0+cu118 CUDA:0 (Tesla T4, 15102MiB)\n",
            "\n",
            "Downloading https://github.com/ultralytics/yolov5/releases/download/v7.0/yolov5s.pt to yolov5s.pt...\n",
            "100% 14.1M/14.1M [00:00<00:00, 24.5MB/s]\n",
            "\n",
            "Fusing layers... \n",
            "YOLOv5s summary: 213 layers, 7225885 parameters, 0 gradients\n",
            "image 1/2 /content/yolov5/data/images/bus.jpg: 640x480 4 persons, 1 bus, 41.5ms\n",
            "image 2/2 /content/yolov5/data/images/zidane.jpg: 384x640 2 persons, 2 ties, 60.0ms\n",
            "Speed: 0.5ms pre-process, 50.8ms inference, 37.7ms NMS per image at shape (1, 3, 640, 640)\n",
            "Results saved to \u001b[1mruns/detect/exp\u001b[0m\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "hkAzDWJ7cWTr"
      },
      "source": [
        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n",
        "<img align=\"left\" src=\"https://user-images.githubusercontent.com/26833433/127574988-6a558aa1-d268-44b9-bf6b-62d4c605cc72.jpg\" width=\"600\">"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "0eq1SMWl6Sfn"
      },
      "source": [
        "# 2. Validate\n",
        "Validate a model's accuracy on the [COCO](https://cocodataset.org/#home) dataset's `val` or `test` splits. Models are downloaded automatically from the [latest YOLOv5 release](https://github.com/ultralytics/yolov5/releases). To show results by class use the `--verbose` flag."
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "WQPtK1QYVaD_",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "cf7d52f0-281c-4c96-a488-79f5908f8426"
      },
      "source": [
        "# Download COCO val\n",
        "torch.hub.download_url_to_file('https://ultralytics.com/assets/coco2017val.zip', 'tmp.zip')  # download (780M - 5000 images)\n",
        "!unzip -q tmp.zip -d ../datasets && rm tmp.zip  # unzip"
      ],
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stderr",
          "text": [
            "100%|██████████| 780M/780M [00:12<00:00, 66.6MB/s]\n"
          ]
        }
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "X58w8JLpMnjH",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "3e234e05-ee8b-4ad1-b1a4-f6a55d5e4f3d"
      },
      "source": [
        "# Validate YOLOv5s on COCO val\n",
        "!python val.py --weights yolov5s.pt --data coco.yaml --img 640 --half"
      ],
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "\u001b[34m\u001b[1mval: \u001b[0mdata=/content/yolov5/data/coco.yaml, weights=['yolov5s.pt'], batch_size=32, imgsz=640, conf_thres=0.001, iou_thres=0.6, max_det=300, task=val, device=, workers=8, single_cls=False, augment=False, verbose=False, save_txt=False, save_hybrid=False, save_conf=False, save_json=True, project=runs/val, name=exp, exist_ok=False, half=True, dnn=False\n",
            "YOLOv5 🚀 v7.0-136-g71244ae Python-3.9.16 torch-2.0.0+cu118 CUDA:0 (Tesla T4, 15102MiB)\n",
            "\n",
            "Fusing layers... \n",
            "YOLOv5s summary: 213 layers, 7225885 parameters, 0 gradients\n",
            "\u001b[34m\u001b[1mval: \u001b[0mScanning /content/datasets/coco/val2017... 4952 images, 48 backgrounds, 0 corrupt: 100% 5000/5000 [00:02<00:00, 2024.59it/s]\n",
            "\u001b[34m\u001b[1mval: \u001b[0mNew cache created: /content/datasets/coco/val2017.cache\n",
            "                 Class     Images  Instances          P          R      mAP50   mAP50-95: 100% 157/157 [01:25<00:00,  1.84it/s]\n",
            "                   all       5000      36335      0.671      0.519      0.566      0.371\n",
            "Speed: 0.1ms pre-process, 3.1ms inference, 2.3ms NMS per image at shape (32, 3, 640, 640)\n",
            "\n",
            "Evaluating pycocotools mAP... saving runs/val/exp/yolov5s_predictions.json...\n",
            "loading annotations into memory...\n",
            "Done (t=0.43s)\n",
            "creating index...\n",
            "index created!\n",
            "Loading and preparing results...\n",
            "DONE (t=5.32s)\n",
            "creating index...\n",
            "index created!\n",
            "Running per image evaluation...\n",
            "Evaluate annotation type *bbox*\n",
            "DONE (t=78.89s).\n",
            "Accumulating evaluation results...\n",
            "DONE (t=14.51s).\n",
            " Average Precision  (AP) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.374\n",
            " Average Precision  (AP) @[ IoU=0.50      | area=   all | maxDets=100 ] = 0.572\n",
            " Average Precision  (AP) @[ IoU=0.75      | area=   all | maxDets=100 ] = 0.402\n",
            " Average Precision  (AP) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.211\n",
            " Average Precision  (AP) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.423\n",
            " Average Precision  (AP) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.489\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=  1 ] = 0.311\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets= 10 ] = 0.516\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area=   all | maxDets=100 ] = 0.566\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area= small | maxDets=100 ] = 0.378\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area=medium | maxDets=100 ] = 0.625\n",
            " Average Recall     (AR) @[ IoU=0.50:0.95 | area= large | maxDets=100 ] = 0.722\n",
            "Results saved to \u001b[1mruns/val/exp\u001b[0m\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "ZY2VXXXu74w5"
      },
      "source": [
        "# 3. Train\n",
        "\n",
        "<p align=\"\"><a href=\"https://bit.ly/ultralytics_hub\"><img width=\"1000\" src=\"https://github.com/ultralytics/assets/raw/main/im/integrations-loop.png\"/></a></p>\n",
        "Close the active learning loop by sampling images from your inference conditions with the `roboflow` pip package\n",
        "<br><br>\n",
        "\n",
        "Train a YOLOv5s model on the [COCO128](https://www.kaggle.com/ultralytics/coco128) dataset with `--data coco128.yaml`, starting from pretrained `--weights yolov5s.pt`, or from randomly initialized `--weights '' --cfg yolov5s.yaml`.\n",
        "\n",
        "- **Pretrained [Models](https://github.com/ultralytics/yolov5/tree/master/models)** are downloaded\n",
        "automatically from the [latest YOLOv5 release](https://github.com/ultralytics/yolov5/releases)\n",
        "- **[Datasets](https://github.com/ultralytics/yolov5/tree/master/data)** available for autodownload include: [COCO](https://github.com/ultralytics/yolov5/blob/master/data/coco.yaml), [COCO128](https://github.com/ultralytics/yolov5/blob/master/data/coco128.yaml), [VOC](https://github.com/ultralytics/yolov5/blob/master/data/VOC.yaml), [Argoverse](https://github.com/ultralytics/yolov5/blob/master/data/Argoverse.yaml), [VisDrone](https://github.com/ultralytics/yolov5/blob/master/data/VisDrone.yaml), [GlobalWheat](https://github.com/ultralytics/yolov5/blob/master/data/GlobalWheat2020.yaml), [xView](https://github.com/ultralytics/yolov5/blob/master/data/xView.yaml), [Objects365](https://github.com/ultralytics/yolov5/blob/master/data/Objects365.yaml), [SKU-110K](https://github.com/ultralytics/yolov5/blob/master/data/SKU-110K.yaml).\n",
        "- **Training Results** are saved to `runs/train/` with incrementing run directories, i.e. `runs/train/exp2`, `runs/train/exp3` etc.\n",
        "<br>\n",
        "\n",
        "A **Mosaic Dataloader** is used for training which combines 4 images into 1 mosaic.\n",
        "\n",
        "## Label a dataset on Roboflow (optional)\n",
        "\n",
        "[Roboflow](https://roboflow.com/?ref=ultralytics) enables you to easily **organize, label, and prepare** a high quality dataset with your own custom data. Roboflow also makes it easy to establish an active learning pipeline, collaborate with your team on dataset improvement, and integrate directly into your model building workflow with the `roboflow` pip package."
      ]
    },
    {
      "cell_type": "code",
      "source": [
        "#@title Select YOLOv5 🚀 logger {run: 'auto'}\n",
        "logger = 'Comet' #@param ['Comet', 'ClearML', 'TensorBoard']\n",
        "\n",
        "if logger == 'Comet':\n",
        "  %pip install -q comet_ml\n",
        "  import comet_ml; comet_ml.init()\n",
        "elif logger == 'ClearML':\n",
        "  %pip install -q clearml\n",
        "  import clearml; clearml.browser_login()\n",
        "elif logger == 'TensorBoard':\n",
        "  %load_ext tensorboard\n",
        "  %tensorboard --logdir runs/train"
      ],
      "metadata": {
        "id": "i3oKtE4g-aNn"
      },
      "execution_count": null,
      "outputs": []
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "1NcFxRcFdJ_O",
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "outputId": "bbeeea2b-04fc-4185-aa64-258690495b5a"
      },
      "source": [
        "# Train YOLOv5s on COCO128 for 3 epochs\n",
        "!python train.py --img 640 --batch 16 --epochs 3 --data coco128.yaml --weights yolov5s.pt --cache"
      ],
      "execution_count": null,
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "2023-04-09 14:11:38.063605: I tensorflow/core/platform/cpu_feature_guard.cc:182] This TensorFlow binary is optimized to use available CPU instructions in performance-critical operations.\n",
            "To enable the following instructions: AVX2 AVX512F FMA, in other operations, rebuild TensorFlow with the appropriate compiler flags.\n",
            "2023-04-09 14:11:39.026661: W tensorflow/compiler/tf2tensorrt/utils/py_utils.cc:38] TF-TRT Warning: Could not find TensorRT\n",
            "\u001b[34m\u001b[1mtrain: \u001b[0mweights=yolov5s.pt, cfg=, data=coco128.yaml, hyp=data/hyps/hyp.scratch-low.yaml, epochs=3, batch_size=16, imgsz=640, rect=False, resume=False, nosave=False, noval=False, noautoanchor=False, noplots=False, evolve=None, bucket=, cache=ram, image_weights=False, device=, multi_scale=False, single_cls=False, optimizer=SGD, sync_bn=False, workers=8, project=runs/train, name=exp, exist_ok=False, quad=False, cos_lr=False, label_smoothing=0.0, patience=100, freeze=[0], save_period=-1, seed=0, local_rank=-1, entity=None, upload_dataset=False, bbox_interval=-1, artifact_alias=latest\n",
            "\u001b[34m\u001b[1mgithub: \u001b[0mup to date with https://github.com/ultralytics/yolov5 ✅\n",
            "YOLOv5 🚀 v7.0-136-g71244ae Python-3.9.16 torch-2.0.0+cu118 CUDA:0 (Tesla T4, 15102MiB)\n",
            "\n",
            "\u001b[34m\u001b[1mhyperparameters: \u001b[0mlr0=0.01, lrf=0.01, momentum=0.937, weight_decay=0.0005, warmup_epochs=3.0, warmup_momentum=0.8, warmup_bias_lr=0.1, box=0.05, cls=0.5, cls_pw=1.0, obj=1.0, obj_pw=1.0, iou_t=0.2, anchor_t=4.0, fl_gamma=0.0, hsv_h=0.015, hsv_s=0.7, hsv_v=0.4, degrees=0.0, translate=0.1, scale=0.5, shear=0.0, perspective=0.0, flipud=0.0, fliplr=0.5, mosaic=1.0, mixup=0.0, copy_paste=0.0\n",
            "\u001b[34m\u001b[1mClearML: \u001b[0mrun 'pip install clearml' to automatically track, visualize and remotely train YOLOv5 🚀 in ClearML\n",
            "\u001b[34m\u001b[1mComet: \u001b[0mrun 'pip install comet_ml' to automatically track and visualize YOLOv5 🚀 runs in Comet\n",
            "\u001b[34m\u001b[1mTensorBoard: \u001b[0mStart with 'tensorboard --logdir runs/train', view at http://localhost:6006/\n",
            "\n",
            "Dataset not found ⚠️, missing paths ['/content/datasets/coco128/images/train2017']\n",
            "Downloading https://ultralytics.com/assets/coco128.zip to coco128.zip...\n",
            "100% 6.66M/6.66M [00:00<00:00, 75.6MB/s]\n",
            "Dataset download success ✅ (0.6s), saved to \u001b[1m/content/datasets\u001b[0m\n",
            "\n",
            "                 from  n    params  module                                  arguments                     \n",
            "  0                -1  1      3520  models.common.Conv                      [3, 32, 6, 2, 2]              \n",
            "  1                -1  1     18560  models.common.Conv                      [32, 64, 3, 2]                \n",
            "  2                -1  1     18816  models.common.C3                        [64, 64, 1]                   \n",
            "  3                -1  1     73984  models.common.Conv                      [64, 128, 3, 2]               \n",
            "  4                -1  2    115712  models.common.C3                        [128, 128, 2]                 \n",
            "  5                -1  1    295424  models.common.Conv                      [128, 256, 3, 2]              \n",
            "  6                -1  3    625152  models.common.C3                        [256, 256, 3]                 \n",
            "  7                -1  1   1180672  models.common.Conv                      [256, 512, 3, 2]              \n",
            "  8                -1  1   1182720  models.common.C3                        [512, 512, 1]                 \n",
            "  9                -1  1    656896  models.common.SPPF                      [512, 512, 5]                 \n",
            " 10                -1  1    131584  models.common.Conv                      [512, 256, 1, 1]              \n",
            " 11                -1  1         0  torch.nn.modules.upsampling.Upsample    [None, 2, 'nearest']          \n",
            " 12           [-1, 6]  1         0  models.common.Concat                    [1]                           \n",
            " 13                -1  1    361984  models.common.C3                        [512, 256, 1, False]          \n",
            " 14                -1  1     33024  models.common.Conv                      [256, 128, 1, 1]              \n",
            " 15                -1  1         0  torch.nn.modules.upsampling.Upsample    [None, 2, 'nearest']          \n",
            " 16           [-1, 4]  1         0  models.common.Concat                    [1]                           \n",
            " 17                -1  1     90880  models.common.C3                        [256, 128, 1, False]          \n",
            " 18                -1  1    147712  models.common.Conv                      [128, 128, 3, 2]              \n",
            " 19          [-1, 14]  1         0  models.common.Concat                    [1]                           \n",
            " 20                -1  1    296448  models.common.C3                        [256, 256, 1, False]          \n",
            " 21                -1  1    590336  models.common.Conv                      [256, 256, 3, 2]              \n",
            " 22          [-1, 10]  1         0  models.common.Concat                    [1]                           \n",
            " 23                -1  1   1182720  models.common.C3                        [512, 512, 1, False]          \n",
            " 24      [17, 20, 23]  1    229245  models.yolo.Detect                      [80, [[10, 13, 16, 30, 33, 23], [30, 61, 62, 45, 59, 119], [116, 90, 156, 198, 373, 326]], [128, 256, 512]]\n",
            "Model summary: 214 layers, 7235389 parameters, 7235389 gradients, 16.6 GFLOPs\n",
            "\n",
            "Transferred 349/349 items from yolov5s.pt\n",
            "\u001b[34m\u001b[1mAMP: \u001b[0mchecks passed ✅\n",
            "\u001b[34m\u001b[1moptimizer:\u001b[0m SGD(lr=0.01) with parameter groups 57 weight(decay=0.0), 60 weight(decay=0.0005), 60 bias\n",
            "\u001b[34m\u001b[1malbumentations: \u001b[0mBlur(p=0.01, blur_limit=(3, 7)), MedianBlur(p=0.01, blur_limit=(3, 7)), ToGray(p=0.01), CLAHE(p=0.01, clip_limit=(1, 4.0), tile_grid_size=(8, 8))\n",
            "\u001b[34m\u001b[1mtrain: \u001b[0mScanning /content/datasets/coco128/labels/train2017... 126 images, 2 backgrounds, 0 corrupt: 100% 128/128 [00:00<00:00, 1709.36it/s]\n",
            "\u001b[34m\u001b[1mtrain: \u001b[0mNew cache created: /content/datasets/coco128/labels/train2017.cache\n",
            "\u001b[34m\u001b[1mtrain: \u001b[0mCaching images (0.1GB ram): 100% 128/128 [00:00<00:00, 264.35it/s]\n",
            "\u001b[34m\u001b[1mval: \u001b[0mScanning /content/datasets/coco128/labels/train2017.cache... 126 images, 2 backgrounds, 0 corrupt: 100% 128/128 [00:00<?, ?it/s]\n",
            "\u001b[34m\u001b[1mval: \u001b[0mCaching images (0.1GB ram): 100% 128/128 [00:01<00:00, 107.05it/s]\n",
            "\n",
            "\u001b[34m\u001b[1mAutoAnchor: \u001b[0m4.27 anchors/target, 0.994 Best Possible Recall (BPR). Current anchors are a good fit to dataset ✅\n",
            "Plotting labels to runs/train/exp/labels.jpg... \n",
            "Image sizes 640 train, 640 val\n",
            "Using 2 dataloader workers\n",
            "Logging results to \u001b[1mruns/train/exp\u001b[0m\n",
            "Starting training for 3 epochs...\n",
            "\n",
            "      Epoch    GPU_mem   box_loss   obj_loss   cls_loss  Instances       Size\n",
            "        0/2      3.91G    0.04618    0.07209    0.01703        232        640: 100% 8/8 [00:09<00:00,  1.17s/it]\n",
            "                 Class     Images  Instances          P          R      mAP50   mAP50-95: 100% 4/4 [00:01<00:00,  2.01it/s]\n",
            "                   all        128        929      0.667      0.602       0.68       0.45\n",
            "\n",
            "      Epoch    GPU_mem   box_loss   obj_loss   cls_loss  Instances       Size\n",
            "        1/2      4.76G    0.04622    0.06891    0.01817        201        640: 100% 8/8 [00:02<00:00,  3.78it/s]\n",
            "                 Class     Images  Instances          P          R      mAP50   mAP50-95: 100% 4/4 [00:01<00:00,  2.16it/s]\n",
            "                   all        128        929      0.709      0.645      0.722      0.478\n",
            "\n",
            "      Epoch    GPU_mem   box_loss   obj_loss   cls_loss  Instances       Size\n",
            "        2/2      4.76G     0.0436     0.0647    0.01698        227        640: 100% 8/8 [00:01<00:00,  4.19it/s]\n",
            "                 Class     Images  Instances          P          R      mAP50   mAP50-95: 100% 4/4 [00:01<00:00,  2.95it/s]\n",
            "                   all        128        929      0.761      0.647      0.735       0.49\n",
            "\n",
            "3 epochs completed in 0.006 hours.\n",
            "Optimizer stripped from runs/train/exp/weights/last.pt, 14.8MB\n",
            "Optimizer stripped from runs/train/exp/weights/best.pt, 14.8MB\n",
            "\n",
            "Validating runs/train/exp/weights/best.pt...\n",
            "Fusing layers... \n",
            "Model summary: 157 layers, 7225885 parameters, 0 gradients, 16.4 GFLOPs\n",
            "                 Class     Images  Instances          P          R      mAP50   mAP50-95: 100% 4/4 [00:06<00:00,  1.56s/it]\n",
            "                   all        128        929      0.759      0.646      0.734       0.49\n",
            "                person        128        254      0.857      0.706      0.805      0.525\n",
            "               bicycle        128          6      0.773      0.577      0.725      0.414\n",
            "                   car        128         46      0.664      0.435      0.551       0.24\n",
            "            motorcycle        128          5      0.587        0.8      0.837      0.635\n",
            "              airplane        128          6          1      0.989      0.995      0.715\n",
            "                   bus        128          7      0.635      0.714      0.753      0.651\n",
            "                 train        128          3      0.686      0.333       0.72      0.504\n",
            "                 truck        128         12      0.604      0.333      0.472      0.259\n",
            "                  boat        128          6      0.938      0.333      0.449      0.177\n",
            "         traffic light        128         14      0.778      0.255      0.401      0.217\n",
            "             stop sign        128          2      0.826          1      0.995      0.895\n",
            "                 bench        128          9      0.711      0.556      0.661      0.313\n",
            "                  bird        128         16      0.962          1      0.995      0.642\n",
            "                   cat        128          4      0.868          1      0.995      0.754\n",
            "                   dog        128          9          1      0.652      0.899      0.651\n",
            "                 horse        128          2      0.853          1      0.995      0.622\n",
            "              elephant        128         17      0.909      0.882      0.934      0.698\n",
            "                  bear        128          1      0.696          1      0.995      0.995\n",
            "                 zebra        128          4      0.855          1      0.995      0.905\n",
            "               giraffe        128          9      0.788      0.828      0.912      0.701\n",
            "              backpack        128          6      0.835        0.5      0.738      0.311\n",
            "              umbrella        128         18      0.785      0.814      0.859       0.48\n",
            "               handbag        128         19      0.759      0.263      0.366      0.205\n",
            "                   tie        128          7      0.983      0.714       0.77      0.492\n",
            "              suitcase        128          4      0.656          1      0.945      0.631\n",
            "               frisbee        128          5      0.721        0.8      0.759      0.724\n",
            "                  skis        128          1      0.737          1      0.995        0.3\n",
            "             snowboard        128          7      0.829      0.696       0.83      0.537\n",
            "           sports ball        128          6      0.637      0.667      0.602      0.311\n",
            "                  kite        128         10      0.636        0.6      0.599      0.226\n",
            "          baseball bat        128          4      0.501       0.25      0.468      0.205\n",
            "        baseball glove        128          7      0.483      0.429      0.465      0.292\n",
            "            skateboard        128          5      0.932        0.6      0.687      0.493\n",
            "         tennis racket        128          7       0.77      0.429      0.547      0.332\n",
            "                bottle        128         18      0.577      0.379      0.554      0.276\n",
            "            wine glass        128         16      0.704      0.875       0.89       0.51\n",
            "                   cup        128         36      0.841      0.667      0.837      0.533\n",
            "                  fork        128          6      0.992      0.333       0.45      0.315\n",
            "                 knife        128         16      0.768      0.688      0.695      0.403\n",
            "                 spoon        128         22      0.838       0.47      0.639      0.384\n",
            "                  bowl        128         28      0.764       0.58      0.716      0.513\n",
            "                banana        128          1      0.902          1      0.995      0.301\n",
            "              sandwich        128          2          1          0      0.359      0.326\n",
            "                orange        128          4      0.722       0.75      0.912      0.581\n",
            "              broccoli        128         11      0.547      0.364      0.432      0.317\n",
            "                carrot        128         24      0.619      0.625      0.724      0.495\n",
            "               hot dog        128          2      0.409          1      0.828      0.762\n",
            "                 pizza        128          5      0.833      0.995      0.962      0.727\n",
            "                 donut        128         14      0.631          1       0.96      0.839\n",
            "                  cake        128          4       0.87          1      0.995       0.83\n",
            "                 chair        128         35      0.583        0.6      0.608      0.317\n",
            "                 couch        128          6      0.907      0.667      0.815      0.544\n",
            "          potted plant        128         14      0.739      0.786      0.823       0.48\n",
            "                   bed        128          3      0.985      0.333       0.83      0.441\n",
            "          dining table        128         13      0.821      0.357      0.578      0.342\n",
            "                toilet        128          2          1      0.988      0.995      0.846\n",
            "                    tv        128          2       0.57          1      0.995      0.796\n",
            "                laptop        128          3          1          0      0.593      0.312\n",
            "                 mouse        128          2          1          0      0.089     0.0445\n",
            "                remote        128          8          1      0.624      0.634      0.538\n",
            "            cell phone        128          8      0.622      0.417      0.421      0.187\n",
            "             microwave        128          3      0.711          1      0.995      0.766\n",
            "                  oven        128          5      0.329        0.4       0.43      0.282\n",
            "                  sink        128          6      0.437      0.333      0.338      0.265\n",
            "          refrigerator        128          5      0.567        0.8      0.799      0.536\n",
            "                  book        128         29      0.597      0.257      0.349      0.154\n",
            "                 clock        128          9      0.765      0.889      0.932      0.736\n",
            "                  vase        128          2       0.33          1      0.995      0.895\n",
            "              scissors        128          1          1          0      0.497     0.0498\n",
            "            teddy bear        128         21      0.856      0.569      0.841      0.547\n",
            "            toothbrush        128          5        0.8          1      0.928      0.574\n",
            "Results saved to \u001b[1mruns/train/exp\u001b[0m\n"
          ]
        }
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "15glLzbQx5u0"
      },
      "source": [
        "# 4. Visualize"
      ]
    },
    {
      "cell_type": "markdown",
      "source": [
        "## Comet Logging and Visualization 🌟 NEW\n",
        "\n",
        "[Comet](https://www.comet.com/site/lp/yolov5-with-comet/?utm_source=yolov5&utm_medium=partner&utm_campaign=partner_yolov5_2022&utm_content=yolov5_colab) is now fully integrated with YOLOv5. Track and visualize model metrics in real time, save your hyperparameters, datasets, and model checkpoints, and visualize your model predictions with [Comet Custom Panels](https://www.comet.com/docs/v2/guides/comet-dashboard/code-panels/about-panels/?utm_source=yolov5&utm_medium=partner&utm_campaign=partner_yolov5_2022&utm_content=yolov5_colab)! Comet makes sure you never lose track of your work and makes it easy to share results and collaborate across teams of all sizes!\n",
        "\n",
        "Getting started is easy:\n",
        "```shell\n",
        "pip install comet_ml  # 1. install\n",
        "export COMET_API_KEY=<Your API Key>  # 2. paste API key\n",
        "python train.py --img 640 --epochs 3 --data coco128.yaml --weights yolov5s.pt  # 3. train\n",
        "```\n",
        "To learn more about all of the supported Comet features for this integration, check out the [Comet Tutorial](https://docs.ultralytics.com/yolov5/tutorials/comet_logging_integration). If you'd like to learn more about Comet, head over to our [documentation](https://www.comet.com/docs/v2/?utm_source=yolov5&utm_medium=partner&utm_campaign=partner_yolov5_2022&utm_content=yolov5_colab). Get started by trying out the Comet Colab Notebook:\n",
        "[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1RG0WOQyxlDlo5Km8GogJpIEJlg_5lyYO?usp=sharing)\n",
        "\n",
        "<a href=\"https://bit.ly/yolov5-readme-comet2\">\n",
        "<img alt=\"Comet Dashboard\" src=\"https://user-images.githubusercontent.com/26833433/202851203-164e94e1-2238-46dd-91f8-de020e9d6b41.png\" width=\"1280\"/></a>"
      ],
      "metadata": {
        "id": "nWOsI5wJR1o3"
      }
    },
    {
      "cell_type": "markdown",
      "source": [
        "## ClearML Logging and Automation 🌟 NEW\n",
        "\n",
        "[ClearML](https://cutt.ly/yolov5-notebook-clearml) is completely integrated into YOLOv5 to track your experimentation, manage dataset versions and even remotely execute training runs. To enable ClearML (check cells above):\n",
        "\n",
        "- `pip install clearml`\n",
        "- run `clearml-init` to connect to a ClearML server (**deploy your own [open-source server](https://github.com/allegroai/clearml-server)**, or use our [free hosted server](https://cutt.ly/yolov5-notebook-clearml))\n",
        "\n",
        "You'll get all the great expected features from an experiment manager: live updates, model upload, experiment comparison etc. but ClearML also tracks uncommitted changes and installed packages for example. Thanks to that ClearML Tasks (which is what we call experiments) are also reproducible on different machines! With only 1 extra line, we can schedule a YOLOv5 training task on a queue to be executed by any number of ClearML Agents (workers).\n",
        "\n",
        "You can use ClearML Data to version your dataset and then pass it to YOLOv5 simply using its unique ID. This will help you keep track of your data without adding extra hassle. Explore the [ClearML Tutorial](https://docs.ultralytics.com/yolov5/tutorials/clearml_logging_integration) for details!\n",
        "\n",
        "<a href=\"https://cutt.ly/yolov5-notebook-clearml\">\n",
        "<img alt=\"ClearML Experiment Management UI\" src=\"https://github.com/thepycoder/clearml_screenshots/raw/main/scalars.jpg\" width=\"1280\"/></a>"
      ],
      "metadata": {
        "id": "Lay2WsTjNJzP"
      }
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "-WPvRbS5Swl6"
      },
      "source": [
        "## Local Logging\n",
        "\n",
        "Training results are automatically logged with [Tensorboard](https://www.tensorflow.org/tensorboard) and [CSV](https://github.com/ultralytics/yolov5/pull/4148) loggers to `runs/train`, with a new experiment directory created for each new training as `runs/train/exp2`, `runs/train/exp3`, etc.\n",
        "\n",
        "This directory contains train and val statistics, mosaics, labels, predictions and augmentated mosaics, as well as metrics and charts including precision-recall (PR) curves and confusion matrices.\n",
        "\n",
        "<img alt=\"Local logging results\" src=\"https://user-images.githubusercontent.com/26833433/183222430-e1abd1b7-782c-4cde-b04d-ad52926bf818.jpg\" width=\"1280\"/>\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "Zelyeqbyt3GD"
      },
      "source": [
        "# Environments\n",
        "\n",
        "YOLOv5 may be run in any of the following up-to-date verified environments (with all dependencies including [CUDA](https://developer.nvidia.com/cuda)/[CUDNN](https://developer.nvidia.com/cudnn), [Python](https://www.python.org/) and [PyTorch](https://pytorch.org/) preinstalled):\n",
        "\n",
        "- **Notebooks** with free GPU: <a href=\"https://bit.ly/yolov5-paperspace-notebook\"><img src=\"https://assets.paperspace.io/img/gradient-badge.svg\" alt=\"Run on Gradient\"></a> <a href=\"https://colab.research.google.com/github/ultralytics/yolov5/blob/master/tutorial.ipynb\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"></a> <a href=\"https://www.kaggle.com/ultralytics/yolov5\"><img src=\"https://kaggle.com/static/images/open-in-kaggle.svg\" alt=\"Open In Kaggle\"></a>\n",
        "- **Google Cloud** Deep Learning VM. See [GCP Quickstart Guide](https://docs.ultralytics.com/yolov5/environments/google_cloud_quickstart_tutorial/)\n",
        "- **Amazon** Deep Learning AMI. See [AWS Quickstart Guide](https://docs.ultralytics.com/yolov5/environments/aws_quickstart_tutorial/)\n",
        "- **Docker Image**. See [Docker Quickstart Guide](https://docs.ultralytics.com/yolov5/environments/docker_image_quickstart_tutorial/) <a href=\"https://hub.docker.com/r/ultralytics/yolov5\"><img src=\"https://img.shields.io/docker/pulls/ultralytics/yolov5?logo=docker\" alt=\"Docker Pulls\"></a>\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "6Qu7Iesl0p54"
      },
      "source": [
        "# Status\n",
        "\n",
        "![YOLOv5 CI](https://github.com/ultralytics/yolov5/actions/workflows/ci-testing.yml/badge.svg)\n",
        "\n",
        "If this badge is green, all [YOLOv5 GitHub Actions](https://github.com/ultralytics/yolov5/actions) Continuous Integration (CI) tests are currently passing. CI tests verify correct operation of YOLOv5 training ([train.py](https://github.com/ultralytics/yolov5/blob/master/train.py)), testing ([val.py](https://github.com/ultralytics/yolov5/blob/master/val.py)), inference ([detect.py](https://github.com/ultralytics/yolov5/blob/master/detect.py)) and export ([export.py](https://github.com/ultralytics/yolov5/blob/master/export.py)) on macOS, Windows, and Ubuntu every 24 hours and on every commit.\n"
      ]
    },
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "IEijrePND_2I"
      },
      "source": [
        "# Appendix\n",
        "\n",
        "Additional content below."
      ]
    },
    {
      "cell_type": "code",
      "metadata": {
        "id": "GMusP4OAxFu6"
      },
      "source": [
        "# YOLOv5 PyTorch HUB Inference (DetectionModels only)\n",
        "import torch\n",
        "\n",
        "model = torch.hub.load('ultralytics/yolov5', 'yolov5s', force_reload=True, trust_repo=True)  # or yolov5n - yolov5x6 or custom\n",
        "im = 'https://ultralytics.com/images/zidane.jpg'  # file, Path, PIL.Image, OpenCV, nparray, list\n",
        "results = model(im)  # inference\n",
        "results.print()  # or .show(), .save(), .crop(), .pandas(), etc."
      ],
      "execution_count": null,
      "outputs": []
    }
  ]
}