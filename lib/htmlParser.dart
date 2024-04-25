import 'dart:convert';

import 'package:brotli/brotli.dart' as brotli;
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parse;
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class ComicThumbnail extends StatelessWidget {
  const ComicThumbnail(
      {required this.comicLink, required this.thumbnailLink, super.key});
  final String comicLink;
  final String thumbnailLink;

  @override
  Widget build(BuildContext context) {
    return Image.network(thumbnailLink);
  }
}

class HtmlParser {
  late http.Response _response;

  Future<void> connect() async {
    const uri = 'https://manatoki335.net/bbs/page.php?hid=update';
    _response = await http.get(Uri.parse(uri), headers: {
      'Accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      'Accept-Encoding': 'br',
      'Accept-Language': 'ko,en;q=0.9,en-US;q=0.8',
    });
  }

  List<ComicThumbnail> test() {
    final List<String> updatedComicsLinks = [];
    final List<String> comicThumbnails = [];

    final decodedStr =
        brotli.brotli.decodeToString(_response.bodyBytes, encoding: utf8);
    dom.Document document = parse.parse(decodedStr);
    var updatedComics = document.body
        ?.querySelector('div[class="miso-post-webzine"]')!
        .querySelectorAll('a[class="ellipsis"]');
    for (var element in updatedComics!) {
      updatedComicsLinks.add(element.attributes['href']!);
      comicThumbnails.add(element.querySelector('img')!.attributes['src']!);
    }

    List<ComicThumbnail> result = [];
    for(int i = 0; i < updatedComicsLinks.length; ++i) {
      result.add(ComicThumbnail(comicLink: updatedComicsLinks[i],thumbnailLink: comicThumbnails[i]));
    }

    return result;
  }

  // String getThumnail() {

  // }
}
