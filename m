Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB94A733
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:40:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA4F3E71;
	Tue, 18 Jun 2019 16:38:33 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C59BA95
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 22:34:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3CFF8180
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 22:34:01 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v9so6522522pgr.13
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 15:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FXE9WdbG9ONgkM2/gm0jD5YCXgChNzqx26okDQdVIS0=;
	b=fkN3QYHRp7QiLIcPu4dvDIWVt80ClVW0UbIbNSd/IH5oix6gqwyZPPETgiA9JVT5mN
	SMyfA1ZvhGv2uzDu2fD6iruT2/x6yxnDAOnSgGNTsIipSqYv4MONuPv2G8OQNPt5nCC2
	mH5r6bOyCadCLyVo3AmTCv1IODdK6iCbkdXxpPfwhFt1koB6V0KLqX1a7UlA/MwS/FZo
	1mXEU0biZqULzGnujdXbDNGAzSt/rHSgsE38DD8zE7e9CRjQyNP/lzH5KbRYmQg1/zIG
	WGX0aGC21snDoZiSyKVZV4vyPtsln2vDqPLxxdRt0kF7WPSUARC1VTbYAb3kiZmNS0Ht
	NYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FXE9WdbG9ONgkM2/gm0jD5YCXgChNzqx26okDQdVIS0=;
	b=JciAkQ0z9/SC4zjsg+I8DY6+7UO7jKBIl9F809GLdF9ZFFKnBXdhsv86+101iGGR0S
	J/jCRoKMEm1RGqDlKW7ocLXnsn1P321ra5Fyd7D9cAdiNyXpsPAWCK1GCOfKIFEDUdRe
	Vc6byFSeE/yxJ9lYguaJWyFxE+r7IJcd9zcWlLHy4+ZvPvYB7PtCxFLwmM7F91OU4zFw
	fVV099VkKqYH316Z6Bv0mI8P/ZIGvHPY1J5s3PfGF/CThavDtNU6ygElkogPuXbak2Kw
	Pf1uhOyRW2u82wb+xbfslTsUoia99sFg1oxcXon53akcA4Jr7u/14rdLosdpTAo1eeLg
	bN5Q==
X-Gm-Message-State: APjAAAVthGupRddwF0bTEDvQU7xTWM7IIw6XC34RlHavFyDiSMKTEvi9
	H3/lu+k+n2D9SMgmXqDRM5+n3WBfY0oiPowd5cI=
X-Google-Smtp-Source: APXvYqxtMwmz5RMBXpPbNAtqBRzVafRwjmwU8uECK3WmiEkXlHqlTTg5kFMybqS1+4dBG7QUU9tpoRIK0FnUwRUdsVc=
X-Received: by 2002:a62:3543:: with SMTP id c64mr33498528pfa.242.1560810840892;
	Mon, 17 Jun 2019 15:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190617181111.5025-1-jakub.kicinski@netronome.com>
	<20190617181111.5025-3-jakub.kicinski@netronome.com>
In-Reply-To: <20190617181111.5025-3-jakub.kicinski@netronome.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 17 Jun 2019 15:33:49 -0700
Message-ID: <CAM_iQpWakh+Tv6URcGtD4FJ-TvOLzf8p2EvYdv8trebfHEk_8g@mail.gmail.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: Jiri Pirko <jiri@resnulli.us>, Neil Horman <nhorman@tuxdriver.com>,
	oss-drivers@netronome.com,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	netem@lists.linux-foundation.org, Jamal Hadi Salim <jhs@mojatatu.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Eric Dumazet <edumazet@google.com>, posk@google.com,
	David Miller <davem@davemloft.net>
Subject: Re: [Netem] [PATCH net v2 2/2] net: netem: fix use after free and
 double free with packet corruption
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

On Mon, Jun 17, 2019 at 11:11 AM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> Brendan reports that the use of netem's packet corruption capability
> leads to strange crashes.  This seems to be caused by
> commit d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> which uses skb->next pointer to construct a fast-path queue of
> in-order skbs.
>
> Packet corruption code has to invoke skb_gso_segment() in case
> of skbs in need of GSO.  skb_gso_segment() returns a list of
> skbs.  If next pointers of the skbs on that list do not get cleared
> fast path list may point to freed skbs or skbs which are also on
> the RB tree.
>
> Let's say skb gets segmented into 3 frames:
>
> A -> B -> C
>
> A gets hooked to the t_head t_tail list by tfifo_enqueue(), but it's
> next pointer didn't get cleared so we have:
>
> h t
> |/
> A -> B -> C
>
> Now if B and C get also get enqueued successfully all is fine, because
> tfifo_enqueue() will overwrite the list in order.  IOW:
>
> Enqueue B:
>
> h    t
> |    |
> A -> B    C
>
> Enqueue C:
>
> h         t
> |         |
> A -> B -> C
>
> But if B and C get reordered we may end up with:
>
> h t            RB tree
> |/                |
> A -> B -> C       B
>                    \
>                     C
>
> Or if they get dropped just:
>
> h t
> |/
> A -> B -> C
>
> where A and B are already freed.
>
> To reproduce either limit has to be set low to cause freeing of
> segs or reorders have to happen (due to delay jitter).
>
> Note that we only have to mark the first segment as not on the
> list, "finish_segs" handling of other frags already does that.
>
> Another caveat is that qdisc_drop_all() still has to free all
> segments correctly in case of drop of first segment, therefore
> we re-link segs before calling it.


Acked-by: Cong Wang <xiyou.wangcong@gmail.com>

Thanks for the detailed description!
_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
