Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 407324A72D
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:39:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6E01DCD;
	Tue, 18 Jun 2019 16:38:21 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3FE7EDAC
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 18:11:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B2AF2822
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 18:11:31 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so11927638qtr.0
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 11:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netronome-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AMC6deF+6+l1sIzTV6dze35plxZ2DmSHea7P0oIImwU=;
	b=ZUbey0VxH3YjPx/e1ik8scopBamCH/gztCUYHjJto/G4ytXsf4HXL1y7ooVTTRpYh4
	+9tkDteyEXzeFtAzxqeDE/b6gITpJi0DCr+BMZRryKxboKLETleQpIQTi4mALEMpgNL1
	WZtXTR9msnSpKwu6erJ8xXB0mbeonZQpjUJa4EaNP47CAyeL9Z4OUTdipKzpzASbyHXu
	lwvU08s/uXpyUo8/7d5IVe3HknrvCeyMFps/ZWejpl2u80qa7XUitLoHERqIr8rRzf3w
	UB4Y6IebVNsLwTdOaddIalihHviyt0XpYUBi2VhgUQkZtMYueqrU8OIuKKuutaotC+Hf
	1kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AMC6deF+6+l1sIzTV6dze35plxZ2DmSHea7P0oIImwU=;
	b=BQ9ciQhfYPdw21zSFp9QzNfzcw0ONS7aNZlaJLaaXoTnfHThdcnffXy9pZ9OzA8Eql
	dHodQEBfUSROabZjIuLac4F22HIRTbaDTHChJaTfNTRHg6P+v8N9u5n9uXPci5b2Oi5B
	hDvsZc1MSiVusmOioBHcmNhxTpBwJGaDiUu4msAIXLfp+aPfes5pLNAm/CKz+oVJ23TP
	+q+57zgwPGja/pwiNbaJ6arzxsA2X0axJiBBzG5F9IxCw55xO5UCRpPX7G1ipndzYRjI
	A/igCE7EvwrrUbekzVheQlm4jQMOiy6BN5VOXIVPtYnGVxdZoJrhf7fRZy9PvE/6Q9wX
	vgkw==
X-Gm-Message-State: APjAAAUWOUDXWAO0GrcPqualYItOu3k5IIRoaobXLbQfAB8s2pUk2eIn
	/OyI3YW0YqJMkgsTpooAg8eicQ==
X-Google-Smtp-Source: APXvYqwgMAz4j/sWlfKFnVK/Q6B9P2KJHBzj8ZKBjqkUMsmmTqC9R/MsDRe4jX3YIxEYPfqM+w1UtQ==
X-Received: by 2002:a05:6214:1306:: with SMTP id
	a6mr9431574qvv.38.1560795090832; 
	Mon, 17 Jun 2019 11:11:30 -0700 (PDT)
Received: from jkicinski-Precision-T1700.netronome.com ([66.60.152.14])
	by smtp.gmail.com with ESMTPSA id
	x10sm9048564qtc.34.2019.06.17.11.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 11:11:30 -0700 (PDT)
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: davem@davemloft.net,
	xiyou.wangcong@gmail.com
Date: Mon, 17 Jun 2019 11:11:09 -0700
Message-Id: <20190617181111.5025-1-jakub.kicinski@netronome.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: jiri@resnulli.us, nhorman@tuxdriver.com, oss-drivers@netronome.com,
	netdev@vger.kernel.org, netem@lists.linux-foundation.org,
	jhs@mojatatu.com, stephen@networkplumber.org,
	edumazet@google.com, posk@google.com
Subject: [Netem] [PATCH net v2 0/2] net: netem: fix issues with corrupting
	GSO frames
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: netem-bounces@lists.linux-foundation.org
Errors-To: netem-bounces@lists.linux-foundation.org

Hi!

Corrupting GSO frames currently leads to crashes, due to skb use
after free.  These stem from the skb list handling - the segmented
skbs come back on a list, and this list is not properly unlinked
before enqueuing the segments.  Turns out this condition is made
very likely to occur because of another bug - in backlog accounting.
Segments are counted twice, which means qdisc's limit gets reached
leading to drops and making the use after free very likely to happen.

The bugs are fixed in order in which they were added to the tree.

Jakub Kicinski (2):
  net: netem: fix backlog accounting for corrupted GSO frames
  net: netem: fix use after free and double free with packet corruption

 net/sched/sch_netem.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

-- 
2.21.0

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
