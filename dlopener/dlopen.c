/*
 * Copyright (C) 2025 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <dlfcn.h>
#include <string.h>
#include <errno.h>
#include <limits.h>
#include <utils/Log.h>

int main(int argc, char *argv[])
{
    const char *path;
    int status = -EINVAL;
    void *handle = NULL;

    if(argc <= 1) {
	printf("Please specify a module to load!\n");
	return status;
    }

    path = argv[1];

    handle = dlopen(path, RTLD_NOW);
    if (handle == NULL) {
        char const *err_str = dlerror();
	printf("load: module=%s\n%s\n", path, err_str?err_str:"unknown");
        status = -EINVAL;
    } else {
		printf("load: module=%s %s\n", path,"Success!");
    }
	return status;
}
