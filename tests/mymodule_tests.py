#!/usr/bin/env python

"""
     mymodule tests
    
"""


# System modules
import sys
from nose.tools import assert_equals

# 3rd party modules


# myproject modules
sys.path.append("../")

from myproject import mymodule

    

########################
# Tests

def setup_module():
    # load configuration

    pass



def teardown_module():
    pass
    

def setup_func():
    pass

def teardown_func():
    pass


# Some tests go here:
def test_always_true():
    # some stuff
    r = mymodule.always_true(True)

    assert r == True


