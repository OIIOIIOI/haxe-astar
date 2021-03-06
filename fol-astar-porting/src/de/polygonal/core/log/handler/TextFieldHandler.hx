/*
 *                            _/                                                    _/
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/
 *   _/                            _/        _/
 *  _/                        _/_/      _/_/
 *
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package de.polygonal.core.log.handler;

import de.polygonal.core.log.LogHandler;
import flash.Lib;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

#if !flash
'The TextFieldHandler class is only available for flash'
#end

using de.polygonal.ds.BitFlags;

/**
 * <p>Writes logging messages to flashlog.txt using the native flash trace() method.</p>
 */
class TextFieldHandler extends LogHandler
{
	var _tf:TextField;
	
	public function new(?tf:TextField)
	{
		super();
		
		if (tf != null)
			_tf = tf;
		else
		{
			_tf = new TextField();
			_tf.defaultTextFormat = new TextFormat('Consolas', 12);
			_tf.autoSize = TextFieldAutoSize.LEFT;
			Lib.current.addChild(_tf);
		}
	}
	
	override function init():Void
	{
		setf(0);
	}
	
	override function output(message:String):Void
	{
		_tf.appendText(message + '\n');
		_tf.scrollV = _tf.maxScrollV;
	}
}