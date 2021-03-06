FROM continuumio/anaconda3
ADD requirements.txt /root/workspace/
WORKDIR /root/workspace
RUN conda config --add channels conda-forge \
  && conda install spacy -y --quiet \
  && apt-get update \
  && apt-get install -y build-essential \
  && pip install -q -r requirements.txt \
  && pip install -q --ignore-installed regex \
  && python -m spacy download en
CMD ["jupyter", "notebook", "--notebook-dir=/root/workspace/jupyter_notebooks", "--ip='*'", "--port=8888", "--no-browser"]