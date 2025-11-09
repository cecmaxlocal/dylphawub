#!/usr/bin/raku

# In Perl, test files are usually placed in a directory named `t/` and have 
# the `.t` extension. These test files can be executed by running `make test` 
# or using the `prove` utility, which is designed to run test scripts.

# To create a test file named `wub.t` for Perl and use it with a Makefile, 
# the steps are:

# 1. Create the test file `t/wub.t` (the `t` directory is the conventional place).

# 2. In `t/wub.t`, write test code using the `Test::More` module or similar 
# testing modules. Example minimal test file:

# ```perl
#!/usr/bin/perl
use strict;
use warnings;
use Test::More tests => 2;

ok(1, 'Test 1 works');
ok( defined(my $x = 42), 'Value is defined');
# ```

# 3. A typical `Makefile.PL` or `Build.PL` will be configured to run these tests when you execute `make test` or `perl Build test`.

# 4. You can run tests from the command line using:

# ```bash
# prove t/wub.t
# ```

# or simply run all tests with:

# ```bash
# make test
# ```

# or

# ```bash
# perl Build test
# ```

# If you want `wub.t` to test specific features or files, you can include those tests inside it. This structure is standard for Perl module distributions and projects.

# This method gives you a way to organize, automate, and verify your Perl code using test files managed by Makefile or Build.PL tools.[1][2][5]

# [1](https://perlmaven.com/perl-testing/test-simple/test-more-prove)
# [2](https://stackoverflow.com/questions/25441445/how-to-run-perl-test-without-t-t-structuret-sub-folder-t)
# [3](https://www.perlmonks.org/?node_id=1182642)
# [4](https://www.endpointdev.com/blog/2009/08/file-test-comparison-table-for-shell/)
# [5](https://perldoc.perl.org/Test)
# [6](https://www.modernperlbooks.com/mt/2013/05/organizing-perl-test-files.html)
# [7](https://users.cs.cf.ac.uk/dave/PERL/node69.html)
# [8](https://gist.github.com/ynonp/81890baad8078e3b9208)
# [9](https://www.perl.com/pub/2004/05/07/testing.html/)
# [10](https://www.youtube.com/watch?v=EOQhaIKbGkc)
