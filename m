Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 481A246DB0
	for <lists.netem@lfdr.de>; Sat, 15 Jun 2019 04:08:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84DDC1701;
	Sat, 15 Jun 2019 02:08:16 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 02FF216EF
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 02:08:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9C808711
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 02:08:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 81F1112EB0323;
	Fri, 14 Jun 2019 19:08:09 -0700 (PDT)
Date: Fri, 14 Jun 2019 19:08:08 -0700 (PDT)
Message-Id: <20190614.190808.2204923376726716417.davem@davemloft.net>
To: jakub.kicinski@netronome.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190612185121.4175-1-jakub.kicinski@netronome.com>
References: <20190612185121.4175-1-jakub.kicinski@netronome.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Fri, 14 Jun 2019 19:08:09 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: netem-bounces@lists.linux-foundation.org
Errors-To: netem-bounces@lists.linux-foundation.org

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Wed, 12 Jun 2019 11:51:21 -0700

> Brendan reports that the use of netem's packet corruption capability
> leads to strange crashes.  This seems to be caused by
> commit d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> which uses skb->next pointer to construct a fast-path queue of
> in-order skbs.
> 
> Packet corruption code has to invoke skb_gso_segment() in case
> of skbs in need of GSO.  skb_gso_segment() returns a list of
> skbs.  If next pointers of the skbs on that list do not get cleared
> fast path list goes into the weeds and tries to access the next
> segment skb multiple times.
> 
> Reported-by: Brendan Galloway <brendan.galloway@netronome.com>
> Fixes: d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>

Please rework the commit message a bit to make things cleared, your
ascii diagrams would be great. :)

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
