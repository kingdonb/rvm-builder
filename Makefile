.PHONY: okteto-builder all echo-tag

TAG_BASE := registry.empfin.kingdonb.dev/kingdonb/builder-oci8

# date tag for "nightly" build
ISO_DATE_TAG := $(shell date +%Y%m%d)

# if .git directory is present, image-tag script will generate a semantically
# informative slug based on the current commit info (as: tag or branch-a1c3e5g)
# (in Okteto dev environment, .git directory has been stripped, so "no-tag")
ifneq ($(wildcard ./.git/*),)
export IMAGE_TAG := $(shell ./script/image-tag)
else
export IMAGE_TAG := no-tag
endif

all: okteto-builder

okteto-builder:
	okteto build -f Dockerfile \
		-t $(TAG_BASE):$(IMAGE_TAG) . --target builder

# the "echo-tag" target can help verify your GNU make binary fully supports
# the needed feature exported environment variables (supposedly gmake 3.81+)
echo-tag:
	@echo $$IMAGE_TAG
