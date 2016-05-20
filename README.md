# snowblog

Blog engine for [Snowdrift](https:///snowdrift.coop). This software is
written in [Haskell](https://www.haskell.org/), and licensed under the
[GNU AGPL](https://www.gnu.org/licenses/agpl-3.0.txt), a copy of which
can be found in the [LICENSE](LICENSE) file.

## Building this on your own machine

First, install [stack](http://docs.haskellstack.org/en/stable/README/)
and
[PostgreSQL](https://wiki.postgresql.org/wiki/Detailed_installation_guides).

    git clone https://git.snowdrift.coop/pharpend/snowblog.git
    cd snowblog
    stack setup
    stack build
    ./sdb.hs devel

Then, visit <http://localhost:3000> on your machine.

The test suite can be run with `./sdb.hs test`.

## Contributing

Anyone is welcome to contribute.

* IRC channel: `#snowdrift` on FreeNode.net
* Bug tracker: <https://git.snowdrift.coop/pharpend/snowblog/issues>
* Mailing lists: <https://lists.snowdrift.coop>

The maintainer is Peter Harpending.

* Email: `peter@harpending.org`
* IRC: `pharpend` on FreeNode.net
