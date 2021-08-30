Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002CF3FB0E7
	for <lists+linux-tegra@lfdr.de>; Mon, 30 Aug 2021 07:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232853AbhH3FsC (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 30 Aug 2021 01:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbhH3FsB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 30 Aug 2021 01:48:01 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 665F3C061575
        for <linux-tegra@vger.kernel.org>; Sun, 29 Aug 2021 22:47:08 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id s25so19957657edw.0
        for <linux-tegra@vger.kernel.org>; Sun, 29 Aug 2021 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=RzIkdEm5aJl66a3p0t6hmEQ+Qv+8MFJLxj5JlLxnEbs=;
        b=A2RCmck6oNYOGrJhBDvFQRi8kjugBVuHujnwWo1WUV6wVVMlk4InvJapPrWLjpYbX8
         ZaDbIkAQe1Fgx+4OkYyPB9/F12voxmgC4B/k1MzY0tXfKejM9T6N7sVdD5arUxpgWs39
         miZns2ewz/NdRpXkVPfgeHj6+Dcw8uO0ZQ19M+O6XYvY/ee5TJYv+fzOiKs2DwAJlB+m
         fKMaX8d9Itf9jZiEb6ug9Eg4DIGJ0VbtDZyAEZMmxgn+5nA3W8Q8BYjoZQyXVHp9UYUR
         cgtqCD75U3kO962i93713QKuLKYUMq09DH9XBcCIJqxCBDf0H0bU12BwDm+LyFp2Qlkk
         OFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=RzIkdEm5aJl66a3p0t6hmEQ+Qv+8MFJLxj5JlLxnEbs=;
        b=jpxHYDyKQ0OLdOr3A5qROyqYYLKGn490kkoNdJytyWqcv5KzxIy1JBm+ptuUvaM7Cz
         ZhaMCYiwCTPM6a8uTp3j/aA0pRIqb2TFEwDFznxoBCjlb+RjxXR7MsPNmi+zW0uM32vq
         TiSRd3dL/eiCOwyXI3u5iLIClbQkBj8oHejf+xQqkTnF1D1fK3gNaVAy+d/Ym2v9kYRn
         BbWfzGXhBXfdf40QYWlqiBDeNJabwE2zwiQ1YTBGyA00vhH7XsEa3Wur7PDHKY1ddCu2
         07YnCcIh2dhQC7296lROyvGbUkz/FcCLykRRvjxXsRSP5AnEj2owMFdgHchY0pvvwUUU
         toiw==
X-Gm-Message-State: AOAM532hNPGXfItsoFgfEXFb8V5sCVI6PxQap08Ws3EsJdHHtkXxhtO8
        y7jfrUM3DVnidD4a8dLwNAkjDlBJwzONdJYP0aE=
X-Google-Smtp-Source: ABdhPJwZrkkgej6wqprkMb5H8oi9l05CX9+1cODePMUAxZ/bMGwkvnTEIqB4HiERqBdBPyfIyrRsvXz0Qx4TnNzcNsE=
X-Received: by 2002:a05:6402:34c3:: with SMTP id w3mr15155994edc.335.1630302426947;
 Sun, 29 Aug 2021 22:47:06 -0700 (PDT)
MIME-Version: 1.0
Reply-To: godwinppter@gmail.com
Sender: godwinpeter2401@gmail.com
Received: by 2002:a54:3251:0:0:0:0:0 with HTTP; Sun, 29 Aug 2021 22:47:06
 -0700 (PDT)
From:   Godwin Pete <godwinnpeter@gmail.com>
Date:   Mon, 30 Aug 2021 07:47:06 +0200
X-Google-Sender-Auth: 4-D4zno4Q5KdbwyQxn42vjpz55c
Message-ID: <CAGyeThA__uEA1o785OKdLA8PeUAPUuOx6eW9+baGbRDZU=T_Gg@mail.gmail.com>
Subject: For your information
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

I just want to use this little opportunity to inform you about my
success towards the transfer. I'm currently out of the country for an
investment with part of my share, after completing the transfer with
an Indian business man. But i will visit your country, next year.
After the completion of my project. Please, contact my secretary to
send you the (ATM) card which I've already credited with the sum of
($500,000.00). Just contact her to help you in receiving the (ATM)
card. I've explained everything to her before my trip. This is what I
can do for you because, you couldn't help in the transfer, but for the
fact that you're the person whom I've contacted initially, for the
transfer. I decided to give this ($500,000.00) as a compensation for
being contacted initially for the transfer. I always try to make the
difference, in dealing with people any time I come in contact with
them. I'm also trying to show that I'm quite a different person from
others whose may have a different purpose within them. I believe that
you will render some help to me when I, will visit your country, for
another investment there. So contact my secretary for the card, Her
contact are as follows,

Full name: Mrs, Jovita Dumuije,
Country: Burkina Faso
Email: jovitadumuije@gmail.com

Thanks, and hope for a good corporation with you in future.

Godwin Peter,
