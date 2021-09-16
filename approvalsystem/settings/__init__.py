from __future__ import absolute_import, unicode_literals
import environ

environ.Env.read_env('config/.env')

from .base import *
from .app import *
from .db import *
from .email import *

if not ENVIRONMENT == 'dev':
    from .production import *
else:
    from .development import *
