all:Sux4JTest/Sux4JTest-0.0.1-jar-with-dependencies.jar gv3query

Sux4JTest/Sux4JTest-0.0.1-jar-with-dependencies.jar:
	mvn -f Sux4JTest/ clean compile assembly:single

gv3query:
	$(MAKE) -C GV3
