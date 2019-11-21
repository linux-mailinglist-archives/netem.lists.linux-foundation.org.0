Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB3A107629
	for <lists.netem@lfdr.de>; Fri, 22 Nov 2019 18:03:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C6928744B;
	Fri, 22 Nov 2019 17:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFagvOhHVLTf; Fri, 22 Nov 2019 17:03:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 89C9987496;
	Fri, 22 Nov 2019 17:03:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7674BC1D74;
	Fri, 22 Nov 2019 17:03:18 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1FFCC18DA
 for <netem@lists.linux-foundation.org>; Thu, 21 Nov 2019 06:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E116B87D6E
 for <netem@lists.linux-foundation.org>; Thu, 21 Nov 2019 06:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqpJ0T8HPeqk for <netem@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 06:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1FB9387D5A
 for <netem@lists.linux-foundation.org>; Thu, 21 Nov 2019 06:17:08 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id a143so1477454vsd.9
 for <netem@lists.linux-foundation.org>; Wed, 20 Nov 2019 22:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YiBi49FvjP3nSJ+tq7cRjTjCswJnlDqL6fkW9+Rrb88=;
 b=ohtHRuoNBdLdMzsOhMGtyG77JE0pnFT+eBFKHOsJv8/nmY37YdSJqb3UeBLbMrGaMZ
 WrCXcxm//el8wALcUTtCgrx1SENwkwhjvUr16zYHhdgzj5/kCtIv/o0pdjDC1iTbEyFd
 xv2ENnjseS6F/8Icie0N3mxttHPwcz7Mfen2Kik9oLhVqUM9Ap9WYY+UhXtb+xV4Oy5+
 Td9HBz59LJW3iGcBsiI0jzQtn9/8c0EmlQgQwnBCeqxIMnkZA1hy01pBtDR5qa5dmDAF
 YyFofRiZ4NBHJ5Tl+e/ItzCOjbTZAJDLZhVStSZfT+otUueMPDswonhTsEqZrn5DuQpi
 ZlAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YiBi49FvjP3nSJ+tq7cRjTjCswJnlDqL6fkW9+Rrb88=;
 b=oc6xxcHrxSzBagGVdDoUq8SpxAj/Xqup60qWB1agnwgjF8+qpdIHIS5I+nOgWhSGz8
 uANFYywflW++/BBmfUttzmACwHBCaARf3tQ/4tkKAuFMYDeklvNYIUKL60cA2Fu7e7GM
 c1/qHgR3Oh0FbIsry0Kyhl/pOHFwIscpFuTMbuAHXy45XjEUxVS9f5uNvsdcf1i6RZA5
 QZrXefBBv/GGVLSQwRfKsayrkxwJjynVDmnw+UjwMSLvFyT+ROP9YnI5UZzIdz7d7POc
 x4PFRV3MHJd91zJr16N5daU2A+f8tj795UtU3wwjdpBfVzyd7jAvutQm36iEpzx+iP2A
 i13w==
X-Gm-Message-State: APjAAAVkwWEEKadt8ifp52D0KkFFB/8GInAkE+ywGRV3xxsx24EVYfAz
 d1tAz0OcaRk6P/GvK3Ag4intEVGSQzLeVmYrgvpYAg==
X-Google-Smtp-Source: APXvYqxwoUWv7NJUGNjIIV6wqg0EZwJ5ht3cKERVU3PAvPNisWn2Ocp364Gm407XJca8zJK8faafq9xh5ZqUiZCYDtc=
X-Received: by 2002:a67:c88f:: with SMTP id v15mr4858688vsk.172.1574317026867; 
 Wed, 20 Nov 2019 22:17:06 -0800 (PST)
MIME-Version: 1.0
From: Dejene Boru <dejene.boru@gmail.com>
Date: Thu, 21 Nov 2019 07:16:55 +0100
Message-ID: <CAG40BELox3-4LRfU7jcfxT7FcXM9bBaW2PvVJ0YLiWHSBU+0GA@mail.gmail.com>
To: netem@lists.linux-foundation.org
X-Mailman-Approved-At: Fri, 22 Nov 2019 17:03:14 +0000
Subject: [Netem] Emulating delay with jitter but without reordering
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux network emulator <netem.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/netem>,
 <mailto:netem-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/netem/>
List-Post: <mailto:netem@lists.linux-foundation.org>
List-Help: <mailto:netem-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/netem>,
 <mailto:netem-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5704082078747095398=="
Errors-To: netem-bounces@lists.linux-foundation.org
Sender: "Netem" <netem-bounces@lists.linux-foundation.org>

--===============5704082078747095398==
Content-Type: multipart/alternative; boundary="0000000000002685f30597d53f7b"

--0000000000002685f30597d53f7b
Content-Type: text/plain; charset="UTF-8"

Hi all,

I want to emulate a delay with some delay variation using Netem. However
even a small jitter like 1ms causes packet reordering.

I have replaced the tfifo internal queue of Netem with pfifo based on the
following suggestions, but it can't prevent reordering.

https://wiki.linuxfoundation.org/networking/netem#contact_info

I would really appreciate if some knows a workaround for this.

Regards
/Dejene

--0000000000002685f30597d53f7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-family:roboto,&quot;helvetica neue&qu=
ot;,helvetica,arial,sans-serif;font-size:12.8px">Hi all,</span><div dir=3D"=
auto" style=3D"font-family:roboto,&quot;helvetica neue&quot;,helvetica,aria=
l,sans-serif;font-size:12.8px"><br><div dir=3D"auto">I want to emulate a de=
lay with some delay variation using Netem. However even a small jitter like=
 1ms causes packet reordering.</div><div dir=3D"auto"><br><div dir=3D"auto"=
>I have replaced the tfifo internal queue of Netem with pfifo based on the =
following suggestions, but it can&#39;t prevent reordering.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://wiki.linuxfoundati=
on.org/networking/netem#contact_info" style=3D"text-decoration-line:none;co=
lor:rgb(66,133,244)">https://wiki.linuxfoundation.org/networking/netem#cont=
act_info</a><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">I would=
 really appreciate if some knows a workaround for this.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Regards=C2=A0</div><div dir=3D"auto">/Dejen=
e</div></div></div></div>

--0000000000002685f30597d53f7b--

--===============5704082078747095398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
--===============5704082078747095398==--
