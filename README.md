apache_paco Cookbook
=========================
Install for apache using paco to CentOS

PreRequirement
=========================
$ vagrant box add base64 CentOS-6.3-x86_64-v20130101.box

```vm.box
   cfg.vm.box = "base64"
```

```json
  "run_list":[
    "recipe[apache_paco::default]",
    "recipe[apache_paco::paco]",
    "recipe[apache_paco::apache]"
  ]
```

License and Authors
-------------------
Authors: Hiroharu Tanaka
