//This file is part of "GZE - GroundZero Engine"
//The permisive licence allow to use GZE for free or commercial project (Apache License, Version 2.0).
//For conditions of distribution and use, see copyright notice in Licence.txt, this license must be included with any distribution of the code.

package  {

	import GZ.Gfx.Object;
	import GZ.Gfx.Buffer;
	import GZ.Gfx.Root;

	/**
	 * @author Maeiky
	 */
	public extension Dispacher  {

//private var cfQueue : Delegate<Bool, QElement, QElement>;
//qaRender : QArray< Delegate<Object, Int, Int, Int, Int> , 1>;



//		public var qaChild : QArray<Root>;



		/*
		public unit uAllDispacher {

			qaUpdate : QArray<Delegate, 1>;

			qaRender : QArray< Delegate , 1>;
			qaPause : QArray<Delegate, 1>;
			qaResume : QArray<Delegate, 1>;
			qaDestroy : QArray<Delegate, 1>;
			qaLimit : QArray< Delegate , 1>;
			//qaBorder : QArray< Delegate , 1>;

		}


		public unit uAllDispacher {

			rRootUpdate : uDispacherRoot;
			rRootRender : uDispacherRoot;
			rRootPause  : uDispacherRoot;
			rRootResume : uDispacherRoot;
			rRootDestroy: uDispacherRoot;
		}

		private unit uDispacherRoot {
			rFirst : *uDispacher;
			rLast : * uDispacher;
			nTotal : Int;
		}

		private unit uDispacher {

			cfDispacher : Function;
			rNext : *uDispacher;
			rPrev : *uDispacher;
			rRoot : *uDispacherRoot;
		}


		public var rAllDispacher : uAllDispacher;

		private var qaQueue : QArray<Delegate, 1>;
		private var qeElement : QElement<Delegate>;
		*/


		public function Dispacher():Void {
		
		}
		
		public function fClearChild() :Void {
	//		qaChild.fClear();
		}

		public function fAddChild(_oObj:Root) :Void {
		//	qaChild.fPush(_oObj);
		}


		public function fDispatchUpdate() :Void {
		/*
			forEach(var _oChild : Root  in  qaChild){
				_oChild.fUpdateRoot();
			}*/
		}

		public function fDispatchRender() :Void {
/*
			forEach(var _oChild : Root  in  qaChild){
				_oChild.fRender();
			}*/
		}

		public function fDispatchContextResume() :Void {
/*
			forEach(var _oChild : Root  in  qaChild){
				_oChild.fContextResume();
			}*/
		}


		/*
		public function fCreateEvent(_qeEvent : QElement<Delegate> ,  _qaRoot :  QArray<Delegate, 1> , _cfFunction: Delegate) :Void {

			_qeEvent = _cfFunction;
			_qaRoot.fPush(_qeEvent);
		}

		public function fDispatchAll( _qaRoot :  QArray<Delegate, 1> ) :Void {

			for (var _qeInc : QElement<Delegate> = _qaRoot.qeFirst; _qeInc != null; _qeInc = _qeInc.qeNext ) {
				 var _cfCall  : Delegate = _qeInc;
				_cfCall();
			}
		}
		*/


	}
}
