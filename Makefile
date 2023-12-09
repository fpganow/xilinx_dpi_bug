
clean-%:
	@echo "Cleaning directory: $*"
	cd $* && rm -rf xsim.dir
	cd $* && rm -f xelab.*
	cd $* && rm -f xsc.*
	cd $* && rm -f xsim_*.*
	cd $* && rm -f xsim.*
	cd $* && rm -f xvhdl.*
	cd $* && rm -f xvlog.*

clean: clean-bad clean-good
	@echo "Cleaning"
