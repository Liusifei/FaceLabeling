Since we change the matlab interface, you need to adapt the Makefile.config to your own machine.

Compile caffe and matlab respectively using "make all -j8" and "make matcaffe" at FaceLabeling/;

Run Face3_demo.m (cd FaceLabeling/matlab/caffe/lfw_cvpr15) to obtain the 3-classes parsing result. 

If you want to test other facial images, please include a shape file (e.g. shape.txt) that contains the face's five points positions. 
There are many existing tools to generate the 5pts, e.g. http://mmlab.ie.cuhk.edu.hk/archive/CNN_FacePoint.htm

The Helen model will be released soon.

Please cite this work in your publications if it helps your research:

@inproceedings{liu2015multi,
  title={Multi-Objective Convolutional Learning for Face Labeling},
  author={Sifei Liu and Jimei Yang and Chang Huang and Ming-Hsuan Yang},
  booktitle={Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition},
  pages={3451--3459},
  year={2015}
}