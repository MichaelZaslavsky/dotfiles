"""
YCM plugin settings
"""


def settings(**kwargs):
    "Updates YCM interpreter & sys paths"
    client_data = kwargs["client_data"]
    return {
        "interpreter_path": client_data["g:ycm_python_interpreter_path"],
        "sys_path": client_data["g:ycm_python_sys_path"],
    }
