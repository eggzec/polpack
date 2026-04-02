import argparse
import logging
import os
import shlex
import shutil
import subprocess  # noqa: S404
import sys
from pathlib import Path


logger = logging.getLogger(name=__name__)
logger.setLevel(logging.DEBUG)

formatter = logging.Formatter(
    "%(asctime)s - %(levelname)s - %(message)s", "%d-%m-%Y %H:%M:%S"
)

file_handler = logging.FileHandler("build.log", "w")
file_handler.setLevel(logging.DEBUG)

file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

stdout_handler = logging.StreamHandler(sys.stdout)
stdout_handler.setLevel(logging.DEBUG)
stdout_handler.addFilter(lambda record: record.levelno != logging.ERROR)
stdout_handler.setFormatter(formatter)
logger.addHandler(stdout_handler)

stderr_handler = logging.StreamHandler(sys.stderr)
stderr_handler.setLevel(logging.ERROR)
stderr_handler.setFormatter(formatter)
logger.addHandler(stderr_handler)


def run_command(command: str, cwd: str | None = None) -> None:
    """Run a shell command, streaming output to the logger.

    Args:
        command (str): Shell command to execute.
        cwd (str | None): Working directory; defaults to current directory.
    """
    if cwd is None:
        logger.warning(
            "No working directory specified. Using current directory."
        )
        cwd_path = Path.cwd()
    else:
        cwd_path = Path(cwd)

    log_file_path = cwd_path / "build.log"

    logger.info(f"Executing command: '{command}' in '{cwd_path}'")

    with subprocess.Popen(  # noqa: S603
        shlex.split(command),
        cwd=str(cwd_path),
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        bufsize=0,
        env=dict(**os.environ, PYTHONUNBUFFERED="1"),
        text=True,
    ) as proc:
        with open(log_file_path, "a", encoding="utf-8") as _log_file:
            for line in proc.stdout:
                logger.debug(line.rstrip())

        rv = proc.wait()

    if rv != 0:
        logger.error(f"Command exited with status {rv}")
        sys.exit(rv)

    logger.info("Command executed successfully.")


def install() -> None:
    """Install the package into the current environment."""
    run_command("uv pip install . -v")


def wheel() -> None:
    """Build a wheel distribution."""
    run_command("uv build --wheel -v")


def clean() -> None:
    """Remove all build artifacts and generated files."""
    logger.debug("Starting cleanup ...")

    run_command("uv pip uninstall polpack")

    remove_names: set[str] = {
        "dist",
        "build",
        "lib",
        ".pytest_cache",
        ".ruff_cache",
    }

    for entry in Path("").iterdir():
        if entry.name in remove_names:
            logger.info(f"Removing '{entry}'")
            shutil.rmtree(entry)
        if entry.name == "bin" and entry.is_dir():
            for bin_entry in entry.iterdir():
                if bin_entry.is_file() and bin_entry.name.startswith("test_"):
                    logger.info(f"Removing '{bin_entry}'")
                    bin_entry.unlink()
        if entry.name.startswith(".mesonpy"):
            logger.info(f"Removing '{entry}'")
            shutil.rmtree(entry)
        if entry.name.endswith("egg-info"):
            logger.info(f"Removing '{entry}'")
            shutil.rmtree(entry)
        if entry.suffix == ".log":
            logger.info(f"Removing '{entry}'")
            entry.unlink()

    logger.info("Finished cleanup.")


def main() -> None:
    """Parse arguments and dispatch to the appropriate build action."""
    parser = argparse.ArgumentParser(description="PolPack Build Script")
    parser.add_argument(
        "mode",
        help="""Build mode:
        'install' -- Install python interface
        'wheel' -- Build python interface wheel
        'clean' -- Remove build artifacts""",
        type=str,
        choices=["install", "wheel", "clean"],
    )

    args = parser.parse_args()

    if not any(vars(args).values()):
        parser.print_help()
        sys.exit(0)

    if args.mode == "install":
        install()
    if args.mode == "wheel":
        wheel()
    if args.mode == "clean":
        clean()


if __name__ == "__main__":
    main()
