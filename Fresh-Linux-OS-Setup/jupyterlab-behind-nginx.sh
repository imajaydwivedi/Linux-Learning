# Generate config file if not exists
jupyter lab --generate-config

# Add following lines in config file ~/.jupyter/jupyter_lab_config.py
# Changes by Ajay
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False

# Ensure JupyterLab starts on boot:
sudo nano /etc/systemd/system/jupyterlab.service

    [Unit]
    Description=Jupyter Lab
    After=network.target

    [Service]
    Type=simple
    PIDFile=/run/jupyter.pid
    ExecStart=/home/saanvi/anaconda3/bin/jupyter-lab --config=/home/saanvi/.jupyter/jupyter_lab_config.py
    User=saanvi
    Group=saanvi
    WorkingDirectory=/home/saanvi
    Restart=always

    [Install]
    WantedBy=multi-user.target


# Enable and start the service
sudo systemctl enable jupyterlab
sudo systemctl start jupyterlab

jupyter kernelspec list

# get running instance of jupyterlab
sudo systemctl status jupyterlab

# Installed kernels
jupyter kernelspec list

# Other kernels - https://github.com/jupyter/jupyter/wiki/Jupyter-kernels
