Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F14A729
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:39:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F49BD98;
	Tue, 18 Jun 2019 16:38:18 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A30562F
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 20:25:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1EB16E6
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 20:25:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id v9so3522810pgr.13
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netronome-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=fTWgvB8I+HVGjWoTHEhKJ/+zcG7F0gFzWP79C5G4/0M=;
	b=GsKVoDsQqMfOmpjUk+NOWe4YzlSNKiLGGs6QaVWJ/Vk1rx2V4AN+ohcgmGDJBOlqiF
	mWWLZsS0C0SUxLs4RkCm6NCn6Ayifck54ZN9/RlF14trxAMwQ5l7t1a9gVH7DKOXv174
	pyPo1UCwPQEffC5uv/YZpm+rp7DnXuG4/3YD/SDoVeS6gO/y3l6rV+p9QgaDnWSEyZ15
	Q7hqBYiE3gxZoog1IKKtGv7J3ZVbPiAif6ClRdu2nPt1CypxJG4gdg2k8GhBWGgHf/dI
	JwE/vWVTV42n7MtKf6e4U5bRZIgjcFLqhLlnMMXmhDRtUPdARKp6PtfNI6yMOVdQA9S3
	VJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fTWgvB8I+HVGjWoTHEhKJ/+zcG7F0gFzWP79C5G4/0M=;
	b=JwNKAw5yOWZlMAQ3M5ZAp7yLUa+WhPVskIKOYVDbfCgENogbowfXmvEmsPktsf2WAR
	iaWboOvckMt2UAaw2xTeKosoKE14ABCubN28vfbrlRGr4sefxqjz3jCb/UmCh5Fp+siS
	JljzKFk15FdLjtJhSkswWJfTfLQUpBnkF3rlnj5B6aPkHB2hp2hzhDbMV3Xik0nxLAyP
	VykUekzeyMvnBs31fAODDWgDbl1tjCI8/S8GWybe7kIM3v/SV35CuXsWX08slJyguAIJ
	st68cHq/gv0+3Ziqhj7D/fM85cCJmeREQ31qRwwsfrE5YwxqtHKCvHa/200nmAL+n40U
	Jfrg==
X-Gm-Message-State: APjAAAXfzxs6mACiaJxdbdenlKgvh7ZdnbIq+qEYsCiiSGwwPqv3TRM2
	0ZtBkhkq0pWC28Oco0j0w0sHOg==
X-Google-Smtp-Source: APXvYqzIJgWGNgUSSnX7qpz8eKoDaWAzt9luC4Y9DHsMPkxpqFdjMylVnwAeZcZirg84lwiW75gENg==
X-Received: by 2002:a65:5347:: with SMTP id w7mr41597040pgr.375.1560630311386; 
	Sat, 15 Jun 2019 13:25:11 -0700 (PDT)
Received: from cakuba.netronome.com (c-71-204-185-212.hsd1.ca.comcast.net.
	[71.204.185.212]) by smtp.gmail.com with ESMTPSA id
	c26sm5375170pfr.71.2019.06.15.13.25.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 15 Jun 2019 13:25:11 -0700 (PDT)
Date: Sat, 15 Jun 2019 13:25:07 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20190615132507.49589073@cakuba.netronome.com>
In-Reply-To: <20190614.190808.2204923376726716417.davem@davemloft.net>
References: <20190612185121.4175-1-jakub.kicinski@netronome.com>
	<20190614.190808.2204923376726716417.davem@davemloft.net>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: jiri@resnulli.us, oss-drivers@netronome.com, netdev@vger.kernel.org,
	netem@lists.linux-foundation.org, jhs@mojatatu.com,
	stephen@networkplumber.org, edumazet@google.com,
	xiyou.wangcong@gmail.com, posk@google.com
Subject: Re: [Netem] [PATCH net] net: netem: fix use after free and double
 free with packet corruption
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux network emulator <netem.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/netem/>
List-Post: <mailto:netem@lists.linux-foundation.org>
List-Help: <mailto:netem-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: netem-bounces@lists.linux-foundation.org
Errors-To: netem-bounces@lists.linux-foundation.org

T24gRnJpLCAxNCBKdW4gMjAxOSAxOTowODowOCAtMDcwMCAoUERUKSwgRGF2aWQgTWlsbGVyIHdy
b3RlOgo+IEZyb206IEpha3ViIEtpY2luc2tpIDxqYWt1Yi5raWNpbnNraUBuZXRyb25vbWUuY29t
Pgo+IERhdGU6IFdlZCwgMTIgSnVuIDIwMTkgMTE6NTE6MjEgLTA3MDAKPiAKPiA+IEJyZW5kYW4g
cmVwb3J0cyB0aGF0IHRoZSB1c2Ugb2YgbmV0ZW0ncyBwYWNrZXQgY29ycnVwdGlvbiBjYXBhYmls
aXR5Cj4gPiBsZWFkcyB0byBzdHJhbmdlIGNyYXNoZXMuICBUaGlzIHNlZW1zIHRvIGJlIGNhdXNl
ZCBieQo+ID4gY29tbWl0IGQ2NjI4MGIxMmJkNyAoIm5ldDogbmV0ZW06IHVzZSBhIGxpc3QgaW4g
YWRkaXRpb24gdG8gcmJ0cmVlIikKPiA+IHdoaWNoIHVzZXMgc2tiLT5uZXh0IHBvaW50ZXIgdG8g
Y29uc3RydWN0IGEgZmFzdC1wYXRoIHF1ZXVlIG9mCj4gPiBpbi1vcmRlciBza2JzLgo+ID4gCj4g
PiBQYWNrZXQgY29ycnVwdGlvbiBjb2RlIGhhcyB0byBpbnZva2Ugc2tiX2dzb19zZWdtZW50KCkg
aW4gY2FzZQo+ID4gb2Ygc2ticyBpbiBuZWVkIG9mIEdTTy4gIHNrYl9nc29fc2VnbWVudCgpIHJl
dHVybnMgYSBsaXN0IG9mCj4gPiBza2JzLiAgSWYgbmV4dCBwb2ludGVycyBvZiB0aGUgc2ticyBv
biB0aGF0IGxpc3QgZG8gbm90IGdldCBjbGVhcmVkCj4gPiBmYXN0IHBhdGggbGlzdCBnb2VzIGlu
dG8gdGhlIHdlZWRzIGFuZCB0cmllcyB0byBhY2Nlc3MgdGhlIG5leHQKPiA+IHNlZ21lbnQgc2ti
IG11bHRpcGxlIHRpbWVzLgo+ID4gCj4gPiBSZXBvcnRlZC1ieTogQnJlbmRhbiBHYWxsb3dheSA8
YnJlbmRhbi5nYWxsb3dheUBuZXRyb25vbWUuY29tPgo+ID4gRml4ZXM6IGQ2NjI4MGIxMmJkNyAo
Im5ldDogbmV0ZW06IHVzZSBhIGxpc3QgaW4gYWRkaXRpb24gdG8gcmJ0cmVlIikKPiA+IFNpZ25l
ZC1vZmYtYnk6IEpha3ViIEtpY2luc2tpIDxqYWt1Yi5raWNpbnNraUBuZXRyb25vbWUuY29tPgo+
ID4gUmV2aWV3ZWQtYnk6IERpcmsgdmFuIGRlciBNZXJ3ZSA8ZGlyay52YW5kZXJtZXJ3ZUBuZXRy
b25vbWUuY29tPiAgCj4gCj4gUGxlYXNlIHJld29yayB0aGUgY29tbWl0IG1lc3NhZ2UgYSBiaXQg
dG8gbWFrZSB0aGluZ3MgY2xlYXJlZCwgeW91cgo+IGFzY2lpIGRpYWdyYW1zIHdvdWxkIGJlIGdy
ZWF0LiA6KQoKSW4gcHJvY2VzcyBvZiByZXdyaXRpbmcgdGhlIGNvbW1pdCBtZXNzYWdlIEkgZm91
bmQgYSBtZW1vcnkgbGVhaywKYW5kIHRoZSBiYWNrbG9nIGFjY291bnRpbmcgaXMgYWxzbyBidWdn
eSBpbiB0aGUgc2VnbWVudGF0aW9uIHBhdGgKCnFkaXNjIG5ldGVtIDgwMDE6IHJvb3QgcmVmY250
IDY0IGxpbWl0IDEwMCBkZWxheSAxOXVzIGNvcnJ1cHQgMSUKIFNlbnQgMzAyMzc4OTYgYnl0ZXMg
MTk4OTUgcGt0IChkcm9wcGVkIDE4ODUsIG92ZXJsaW1pdHMgMCByZXF1ZXVlcyAyODcpCiBiYWNr
bG9nIDBiIDk5cCByZXF1ZXVlcyAyODcKICAgICAgICAgXl5eXl5eCiAgICAgICAgIDk5IHBhY2tl
dHMgYnV0IDAgYnl0ZXMKCkkgbmVlZCBhbiBpbnRlcm5hbCByZXZpZXcsIGFuZCB3aWxsIHJlcG9z
dCBzb29uLiAgSSBuZWVkIHRvIHN0b3AgbG9va2luZwpmb3IgYnVncyBoZXJlIPCfmYgKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTmV0ZW0gbWFpbGluZyBs
aXN0Ck5ldGVtQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25ldGVt
