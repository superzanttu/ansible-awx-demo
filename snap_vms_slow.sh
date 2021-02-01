#!/bin/bash

vagrant halt
vagrant snapshot tool save temp_state_v
vagrant snapshot awx save temp_state_v
vagrant snapshot minion1 save temp_state_v
vagrant snapshot minion2 save temp_state_v
vagrant up
