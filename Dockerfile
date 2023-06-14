FROM jupyter/base-notebook

RUN pip install tensorflow \
        plotly numpy pandas \
        matplotlib scikit-learn \
        kaleido psutil ipywidgets

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]