Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D35916D6078
	for <lists+linux-tegra@lfdr.de>; Tue,  4 Apr 2023 14:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbjDDMeL (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 4 Apr 2023 08:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234870AbjDDMeJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 08:34:09 -0400
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEAC3584;
        Tue,  4 Apr 2023 05:34:02 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailnew.nyi.internal (Postfix) with ESMTP id C199A582093;
        Tue,  4 Apr 2023 08:34:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 08:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680611640; x=1680618840; bh=o+OQnLpJCCiwmnk+lu4hNKvy3ldBNEpHSiF
        2EVuNWrw=; b=Vv5mOQOK6GqYKsXZhaDRRGnogUYmOWzpL0+oPX228bsNMy0GT5y
        IDv4+zGaRyNZMISm4ZkDjDqN64KDKK9ue0dvTG0tA/STDGjJAHNwj2AT7kbp3zL+
        3TK+XjC3kTZ39yfL42vn9pDhzjSb9sdpCEjQ0s6UsbXSN1j0JrfulscAV+iK5+H/
        qI4X31sljo0ipj9VbVNH6TJzf4PdXIQ2RwNHOY9nvqpsFn1iw4zQ7AsRhv3sWIH0
        RTwcc2EkG9wtlaiMXKHeAB32cBi0knHP4jnZihtRN6FqAqi57kgd8lY8EOIJVZQy
        ISOiRkmkJNQ8HCOZ7If1C90P5EX0I0jDuxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680611640; x=1680618840; bh=o+OQnLpJCCiwmnk+lu4hNKvy3ldBNEpHSiF
        2EVuNWrw=; b=jvwNaRMYpiKcIImHYx3fUYeRkvnBREkVTZiMIcM3vpHLnA5MQAw
        dHInOGAzviFHCBRdelYoI32OC0V4Wu92y6lrBQzSRpwRxByaY1wa6qQUrMMFqEct
        irY0SeiiTASzR+UhXX7wBiBt5o+Etf1WRxR1zDeRBc9Db486qDFioanzBqBzdVzm
        QdrOcxJxhDV1ue1nnTk/sNwA+AQ4As9Uh+JhGBxItGzrU730KOKAQyEDr6v2aZSU
        N6uWf7xSc0RZ0nZR4iGZwH/PL0PeMY+G74d0itft2P/176H8u9xfqeTTS5h/cqfi
        jAu14plMUQgUxigzFFTK8u27AxcsMuraAhA==
X-ME-Sender: <xms:NhksZCkh63te2D71qbUIrEn6R5uvFX2wZniVfu1SizGfejFdNK8-zA>
    <xme:NhksZJ0QqmrCRDIxxwoiVIVDPHitgiRsO0Q61sHGjbqPgKzDifY3GJqNaRI361ex9
    gy7ZMfAbtcYVY1Kydo>
X-ME-Received: <xmr:NhksZAp5cqPR1eU1KSJNSj2jQalF9lpYaygmE5Rgu8T1vrgQKhIjtJNTHcSTTEGKgWpKp8grENFK1XEwnYMWLiu63_wfC40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NhksZGnxl_bVVCnVGNyL6aFKGbWm3tVo8tNFh7aKX47KU8zPbCYv5w>
    <xmx:NhksZA3kpVg8p2YtOu4UqxGHJQzhhcni8fDyXpRWCuAyEOrTug5pGg>
    <xmx:NhksZNtjaMzBDhkaJ5pst-Tvc63Rtn6WlYW1UwUJUOFcpQoT9LqC3A>
    <xmx:OBksZHh0vIuFIZMpbt-UsjwvGeyE7PdPqIb3MKqM2buJqWP25WqfDQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 08:33:57 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 04 Apr 2023 12:11:01 +0200
Subject: [PATCH v3 11/65] clk: k210: aclk: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v3-11-9a1358472d52@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
        linux-rtc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=utithzISL6/XPhGmUQu4qYiVhTK9xJ+xmbkbSMagrCk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCna37eey66s69xk4OgiNH0bz7VYH9eVbEyzT+a6nV0wZ8P5
 r4YMHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjI4leMDA83z/XqdGq66b1crFDYPX
 nTDp/kj1JhG01OGKwJ3MK1PpCR4cPuc38L62b6Cs4VeODYW7txwrWICSERpcVGK5lbuju6uQE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The K210 ACLK clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise. __clk_mux_determine_rate() has the exact same behavior when
CLK_SET_RATE_NO_REPARENT is set.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-k210.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-k210.c b/drivers/clk/clk-k210.c
index a96ab8611e1f..4cd6544ab102 100644
--- a/drivers/clk/clk-k210.c
+++ b/drivers/clk/clk-k210.c
@@ -639,6 +639,7 @@ static unsigned long k210_aclk_get_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops k210_aclk_ops = {
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent	= k210_aclk_set_parent,
 	.get_parent	= k210_aclk_get_parent,
 	.recalc_rate	= k210_aclk_get_rate,
@@ -661,6 +662,7 @@ static int __init k210_register_aclk(struct device_node *np,
 	init.parent_data = parent_data;
 	init.num_parents = 2;
 	init.ops = &k210_aclk_ops;
+	init.flags = CLK_SET_RATE_NO_REPARENT;
 	ksc->aclk.init = &init;
 
 	ret = of_clk_hw_register(np, &ksc->aclk);

-- 
2.39.2

