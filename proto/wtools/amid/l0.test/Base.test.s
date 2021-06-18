( function _Base_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{
  const _ = require( '../../../node_modules/Tools' );
  _.include( 'wTesting' );
}

const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// context
// --

function onSuiteBegin()
{
  let self = this;

  __.process.start
  ({
    currentPath : __.path.join( __dirname, '../../../../' ),
    execPath : 'will .imply withSubmodules:0 .build module.build',
    verbosity : 7,
  });
}

//

function onSuiteEnd()
{
  let self = this;
}

// --
// test
// --

function npmTest( test )
{
  let context = this;
  let a = test.assetFor( test, false );

  /* */

  a.ready.then( () =>
  {
    test.case = 'run all tests';
    return null;
  });
  a.shell({ currentPath : a.abs( '../../../../' ), execPath : 'wtest .run proto/wtools/abase/ rapidity:-2', verbosity : 7 });
  a.ready.then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
    return null;
  });
}

// --
// declare
// --

const Proto =
{

  name : 'Tools.Base',
  silencing : 1,
  routineTimeOut : 7200000, /* 2 hours */

  onSuiteBegin,
  onSuiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {
    npmTest,
  },

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

