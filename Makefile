RESUME := resume_en.pdf resume_fr.pdf

.PHONY: all
all: ${RESUME}

${RESUME}: %.pdf: %.tex .docker-build
	docker run --rm \
		--volume ${CURDIR}:${CURDIR} \
		--workdir ${CURDIR} \
		--user $$(id -u):$$(id -g) \
		resume_builder \
		pdflatex $<

.PHONY: .docker-build
.docker-build: Dockerfile
	docker build --file $< --tag resume_builder ${CURDIR}

.PHONY: clean
clean:
	rm -f ${RESUME}
