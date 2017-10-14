FROM caffe:cpu
EXPOSE 5000

RUN pip install Flask

RUN wget 'https://raw.githubusercontent.com/yahoo/open_nsfw/master/nsfw_model/deploy.prototxt' -O 'model_def.prototxt'
RUN wget 'https://github.com/yahoo/open_nsfw/raw/master/nsfw_model/resnet_50_1by2_nsfw.caffemodel' -O 'pretrained_model.caffemodel'

COPY http.py /workspace/

ENV MODEL_DEF model_def.prototxt
ENV PRETRAINED_MODEL pretrained_model.caffemodel
ENV HOST 0.0.0.0
ENV PORT 5000
ENV MAX_CONTENT_LENGTH 16777216

CMD python http.py
