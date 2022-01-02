Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8310482ACE
	for <lists+linux-tegra@lfdr.de>; Sun,  2 Jan 2022 12:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbiABLVb (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Sun, 2 Jan 2022 06:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232252AbiABLVa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 2 Jan 2022 06:21:30 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70578C061574
        for <linux-tegra@vger.kernel.org>; Sun,  2 Jan 2022 03:21:30 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id w20so55548438wra.9
        for <linux-tegra@vger.kernel.org>; Sun, 02 Jan 2022 03:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=M5UVflq7la7cPxqI0wzy/Z6/d0Fww5PKIhm5tAruZg+pa8bCUPIBBE2IaglB0ZCKXz
         CIYn/t0dx+Lm2W6zdQh3CIyc2J9OkAvizt2QxHiQcSSaw7+Ckj0Ql3RfaLdszXSyrWft
         yux0EhgJFtkRs80jsFkHNfOvfck7IOoP3Maawd3g+6sGfJ5rUYGghiS2eEqaE8sFhJ5S
         HUngsv80BRFBr0CahKihliLQzSZ9ATWY6nWNofgDTgN1wJiEaxCkNUG6cRqBQy365sjo
         9QBnKGdA65MOpt9xnGKkaXSTGG2bkbqWcbxGTr5JrCt4lFsga0ftfvAe8XRBcOajnWtl
         AtIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=g8Z10qgIS0EarfPNyU/0T6kl3UEk/EndXdl7judHSI4=;
        b=qK4q5QHJ9g5XurtHv7TSYlbOnT5u67LKxzGvaT0ANktf2Tta5aLs9v9lvuP7ixY9Q+
         3ZhEWU6+a1FarmRMo+FTD9Kg0oTvmdHrimfh9N1rKKnXAD6KRiIuFFRUgcXUA8OT4Ah3
         TzYQONL2cm/qa1WyEJYBGRKUdagHoIhhn7VWGDC/5qtTMsolRODw5BZi5dzyEBdp9ZIC
         83ed+BWfZu1Gliy7Njvsybu4u7wv1RK7sTx6FXJvv8j8ui8vh171WErvI7ZFpf4sD2D5
         glYPb0Mhh9LF5UyThJMHGC2L1aKHnU+0hSfh0/wIyuGr3k6mlQFl+YjqfVNbLfZO0Of/
         s2UA==
X-Gm-Message-State: AOAM532kdIiRB4oLuxAlFfOqjl9aENEDyByZVhe42nZ2DbXrRNLXI4x8
        IWB+KQkbZIrBKtRKQu+uYqU=
X-Google-Smtp-Source: ABdhPJzyQBr7px44EFNQWDcz1ilXLENnS1QzqquZah7r4leBuEPNeeYhoQFcUFUQzdquPFQkLpmIgg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr34988266wrw.515.1641122488558;
        Sun, 02 Jan 2022 03:21:28 -0800 (PST)
Received: from [192.168.9.102] ([197.211.59.105])
        by smtp.gmail.com with ESMTPSA id p11sm36149206wru.99.2022.01.02.03.21.24
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jan 2022 03:21:27 -0800 (PST)
Message-ID: <61d18ab7.1c69fb81.d653.7621@mx.google.com>
From:   Margaret Leung KO May-yeee <barjmk79@gmail.com>
X-Google-Original-From: Margaret Leung KO May-yeee
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?Gesch=C3=A4ftsvorschlag?=
To:     Recipients <Margaret@vger.kernel.org>
Date:   Sun, 02 Jan 2022 12:21:20 +0100
Reply-To: la67737777@gmail.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Am Mrs. Margaret Leung I have a business proposal for you reach at: la67737=
777@gmail.com

Margaret Leung
Managing Director of Chong Hing Bank
