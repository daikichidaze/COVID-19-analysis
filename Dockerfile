FROM python:3
USER root

RUN apt-get update

ENV TERM xterm

ARG project_dir=/workdir

WORKDIR $project_dir
ADD requirements.txt $project_dir

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install -r requirements.txt

ENTRYPOINT ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]

# CMD命令はコンテナ起動時に実行するコマンドを指定（docker runの時に上書きする可能性のあるもの）
# "--notebook-dir=/workdir" => Jupyter Labのルートとなるディレクトリを指定
CMD ["--notebook-dir=/workdir"]