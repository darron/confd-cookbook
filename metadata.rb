# encoding: utf-8
name             'confd'
maintainer       'Darron Froese'
maintainer_email 'darron@froese.org'
license          'Apache 2.0'
description      'Installs/configures confd'
version          '0.1.0'
recipe           'confd::default', 'Installs/configures confd'

depends 'chef-sugar'
