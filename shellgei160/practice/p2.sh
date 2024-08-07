#!/bin/bash

ls ../qdata/2/img/*.png | sed 's/\.png$//' | xargs -I@ convert @.png @.jpg
